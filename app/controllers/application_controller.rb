class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method  :logged_in?
  before_action :authenticate_user!


  # def current_user
  #  # Look up the current user based on user_id in the session cookie:
  #  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

  # def logged_in?(user_id)
  #   !!session[:user_id]
  # end
  #
  # def authorize
  #   redirect_to login_path, alert: 'You must be logged in to access this page.' if current_user.nil?
  # end
end
