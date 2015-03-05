class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def authenticate_user!
    unless user_signed_in?
      redirect_to root_path, alert: "Please sign in"
    end
  end

  def authenticate_admin!
    unless admin_signed_in?
      redirect_to root_path
    end
  end

  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def admin_signed_in?
    user_signed_in? && current_user.is_admin
  end
  helper_method :admin_signed_in?

  def current_user
    @current_user ||= User.find session[:user_id] if user_signed_in?
  end
  helper_method :current_user

end
