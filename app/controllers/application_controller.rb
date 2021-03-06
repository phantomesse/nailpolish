class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :require_user
  
  def current_user
    if @current_user.nil?
      @current_user = User.find(session[:user_id]) if session[:user_id]
    end
  end
  helper_method :current_user
  
  # Filter
  def require_user
    redirect_to login_path unless current_user
  end
end
