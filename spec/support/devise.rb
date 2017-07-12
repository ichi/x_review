module Devise
  SCOPES = [:administrator, :user]

  module ResourceHelper
    def create_resource(name)
      send("current_#{name}")
    rescue NameError
      create(name)
    end
  end

  module ControllerMacros
    SCOPES.each do |scope|
      define_method "login_#{scope}" do
        before(:each) do
          @request.env["devise.mapping"] = Devise.mappings[scope]
          resource = create_resource(scope)
          sign_in resource, scope: scope
        end
      end
    end
  end

  module RequestMacros
    SCOPES.each do |scope|
      define_method "login_#{scope}" do
        before(:each) do
          resource = create_resource(scope)
          login_as resource, scope: scope, :run_callbacks => false

          allow_any_instance_of(Warden::Proxy).to receive(:user) do |proxy, options|
            proxy.instance_variable_get(:@users)[options[:scope]]
          end
        end

        after(:each) do
          Warden.test_reset!
        end
      end
    end
  end

  module RoutingMacros
    def authenticated(scope = nil)
      before do
        stubs = {:authenticate? => true}.merge(
          scope ? {scope => create_resource(scope)} : {}
        )
        mock_warden = double(stubs)

        allow_any_instance_of(ActionDispatch::Request).to receive(:env){|req| req.instance_variable_get(:@env).merge('warden' => mock_warden)  }
      end
    end
  end
end

RSpec.configure do |config|
  config.include Devise::ResourceHelper

  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.extend  Devise::ControllerMacros, :type => :controller

  config.include Warden::Test::Helpers, :type => :request
  config.extend  Devise::RequestMacros, :type => :request

  config.extend  Devise::RoutingMacros, :type => :routing
end
