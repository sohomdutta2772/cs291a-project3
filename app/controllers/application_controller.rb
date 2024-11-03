class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user
  before_action :logged_in?

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end 

  def logged_in?
    if request.path == login_path || request.path == logout_path
      return
    end 
    
    if !current_user
      redirect_to login_path
    end 
  end 

end
