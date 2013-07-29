class UsersController < ApplicationController
  skip_before_filter :eject

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Signed up!'
      session[:id] = @user.id
      redirect_to positions_path
    else
      render :new
    end
  end
end

