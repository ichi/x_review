require "rails_helper"

RSpec.describe My::AuthenticationsController, type: :routing do
  describe "routing" do

    it "routes to #destroy" do
      expect(:delete => "/users/auth/twitter").to route_to("my/authentications#destroy", :provider => 'twitter')
    end

  end
end
