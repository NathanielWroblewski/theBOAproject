class UsersController < ApplicationController
  skip_before_filter :eject

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to positions_path, notice: 'Signed up!'
    else
      flash[:notice] = 'Fields cannot be blank.'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    p params
    user = User.find(session[:id])
    user.update_attributes(params[:user])
    redirect_to user, notice: 'Profile updated.'
  end

  def destroy

  end
end

