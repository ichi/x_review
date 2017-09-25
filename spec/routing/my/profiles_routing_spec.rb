require "rails_helper"

RSpec.describe My::ProfilesController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(:get => "/my/profile").to route_to("my/profiles#show")
    end

    it "routes to #edit" do
      expect(:get => "/my/profile/edit").to route_to("my/profiles#edit")
    end

    it "routes to #update via PUT" do
      expect(:put => "/my/profile").to route_to("my/profiles#update")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/my/profile").to route_to("my/profiles#update")
    end

    it "routes to #destroy" do
      expect(:delete => "/my/profile").to route_to("my/profiles#destroy")
    end

  end
end
