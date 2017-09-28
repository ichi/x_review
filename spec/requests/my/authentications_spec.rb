require 'rails_helper'

RSpec.describe "My::Authentications", type: :request do
  let(:current_user){ create(:user) }
  let(:authentication){ create(:authentication, user: current_user) }

  login_user!

  describe "DELETE /users/auth/:provider" do
    it "works! (now write some real specs)" do
      delete my_authentication_path(provider: authentication.provider)
      expect(response).to redirect_to(my_profile_url)
    end
  end
end
