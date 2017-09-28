require 'rails_helper'

RSpec.describe "My::Profiles", type: :request do

  login_user!

  describe "GET /my/profile" do
    it "works! (now write some real specs)" do
      get my_profile_path
      expect(response).to have_http_status(200)
    end
  end
end
