class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end
  def logged_in?
    return (not current_user.nil?)
  end
  helper_method :current_user
  helper_method :logged_in?
end
