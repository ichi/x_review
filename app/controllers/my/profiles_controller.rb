class My::ProfilesController < ApplicationController
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
      if current_user.update(user_params)
        format.html { redirect_to my_profile_url, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: my_profile_url }
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my/profile
  # DELETE /my/profile.json
  def destroy
    current_user.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :image_url)
  end
end
