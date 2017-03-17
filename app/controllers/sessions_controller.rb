class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])

      session[:user_id] = @user.id
      flash[:success] = "Successfully Login!"
      redirect_to todo_lists_path(current_user)
    else
      flash.now[:error] = "There was a problem with authenticating."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
