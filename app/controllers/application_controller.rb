class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    if current_user
      true
    else
      redirect_to new_session_path, notice: "You must be logged in!"
    end
  end

   def logged_in?
    current_user
  end
  helper_method :logged_in?
end
