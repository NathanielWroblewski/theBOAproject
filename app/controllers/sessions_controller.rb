class SessionsController < ApplicationController
  skip_before_filter :eject

  def create
    user = User.find_by_email(params[:email])
    login(user, params[:password])
  end

  def destroy
    session.clear
    redirect_to root_url, notice: 'Logged out!'
  end

  private

  def login(user, password)
    if authenticated?(user, password)
      set_session(user.id)
    else
      bounce
    end
  end

  def authenticated?(user, password)
    user && user.authenticate(password)
  end

  def set_session(id)
    session[:id] = id
    redirect_to positions_path, notice: 'Logged in.'
  end

  def bounce
    redirect_to root_url, notice: 'Invalid email or password.'
  end
end
