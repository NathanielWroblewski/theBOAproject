class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :eject

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def eject
    redirect_to root_path if session[:id].nil?
  end
end
