class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  %i(twitter).each do |provider|
    define_method provider do
      create
    end
  end

  # GET|POST /resource/auth/:provider
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/:provider/callback
  # def failure
  #   super
  # end

  protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  def create
    auth_params = request.env['omniauth.auth']
    @authentication = Authentication.from_omniauth(auth_params, current_user)

    if user_signed_in?
      flash[:notice] = 'Successfully linked that account'
    else
      sign_in @authentication.user, event: :authentication
      flash[:notice] = 'Signed in'
    end

    redirect_to after_sign_in_path_for(current_user)
  end
end
