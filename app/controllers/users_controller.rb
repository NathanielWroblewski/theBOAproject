class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Signed up!'
      session[:id] = @user.id
      redirect_to root_url
    else
      render :new
    end
  end
end

