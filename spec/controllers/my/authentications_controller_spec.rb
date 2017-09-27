require 'rails_helper'

RSpec.describe My::AuthenticationsController, type: :controller do
  let(:current_user){ create(:user) }
  let(:authentication){ create(:authentication, user: current_user) }

  login_user!

  describe "DELETE #destroy" do
    before do
      authentication
    end

    it "destroys the requested authentication" do
      expect {
        delete :destroy, params: {provider: authentication.provider}
      }.to change(Authentication, :count).by(-1)
    end

    it "redirects to the my profile" do
      delete :destroy, params: {provider: authentication.provider}
      expect(response).to redirect_to(my_profile_url)
    end
  end

end
