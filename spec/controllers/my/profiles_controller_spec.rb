require 'rails_helper'

RSpec.describe My::ProfilesController, type: :controller do
  let(:current_user){ create(:user) }

  let(:valid_attributes) { attributes_for(:user) }
  let(:invalid_attributes) { valid_attributes.merge(name: '') }

  login_user!

  describe "GET #show" do
    it "returns a success response" do
      get :show
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit
      expect(response).to be_success
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { attributes_for(:user) }

      it "updates the requested my_profile" do
        put :update, params: {user: new_attributes}
        current_user.reload
        expect(current_user).to have_attributes(new_attributes)
      end

      it "redirects to the my_profile" do
        put :update, params: {user: valid_attributes}
        expect(response).to redirect_to(my_profile_url)
      end
    end

    context "with invalid params" do
      it "re-renders the 'edit' template" do
        put :update, params: {user: invalid_attributes}
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      current_user
    end

    it "destroys the requested my_profile" do
      expect {
        delete :destroy
      }.to change(User, :count).by(-1)
    end

    it "redirects to the my_profiles list" do
      delete :destroy
      expect(response).to redirect_to(root_url)
    end
  end

end
