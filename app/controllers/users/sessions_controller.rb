class Users::SessionsController < Devise::SessionsController
  include Devisable

  # GET /sign_in
  def new
  end

  # DELETE /sign_out
  # def destroy
  #   super
  # end
end
