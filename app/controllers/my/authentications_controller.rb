class My::AuthenticationsController < ApplicationController
  before_action :set_authentication, only: [:destroy]

  # DELETE /users/auth/:provider
  def destroy
    @auth.destroy

    redirect_to my_profile_url, notice: '連携を解除しました'
  end

  private

  def set_authentication
    @auth = current_user.authentications.where(provider: params[:provider]).first!
  end
end
