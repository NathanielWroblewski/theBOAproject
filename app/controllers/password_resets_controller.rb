class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    user.send_password_reset if user
    redirect_to root_url, flash: { notice: 'Email sent with password reset instructions.' }
  end

  def edit
    @user = User.find_by!(password_reset_token: params[:id])
  end

  def update
    @user = User.find_by!(password_reset_token: params[:id])
    if @user.update_attributes(user_params)
      redirect_to root_url, flash: { notice: 'Password reset.' }
    else
      render :edit, flash: { notice: 'Error: password not reset.' }
    end
  end
end
