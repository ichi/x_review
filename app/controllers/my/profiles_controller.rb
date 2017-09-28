class My::ProfilesController < ApplicationController
  before_action :set_user, only: %i(show edit update destroy)

  # GET /my/profile
  # GET /my/profile.json
  def show
  end

  # GET /my/profile/edit
  def edit
  end

  # PATCH/PUT /my/profile
  # PATCH/PUT /my/profile.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to my_profile_url, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: my_profile_url }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my/profile
  # DELETE /my/profile.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.includes(:authentications).find current_user.id
  end

  def user_params
    params.require(:user).permit(:name, :image_url)
  end
end
