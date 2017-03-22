class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index

  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new()
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def create
    # byebug
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id


      redirect_to '/', notice: 'User was successfully created.'
    else
      redirect_to '/signup_path'
    end
  end


  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :access_level, :password, :password_confirmation)
  end
end
