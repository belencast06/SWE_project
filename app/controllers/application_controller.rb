class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  skip_before_action :verify_authenticity_token unless Rails.env.production?

  helper_method :current_user, :logged_in?

  before_action :require_login
  
  # Get the current user based on session
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Check if user is logged in
  def logged_in?
    !!current_user
  end

  # Redirect if not logged in
  def require_login
    redirect_to login_path, alert: "Please log in first" unless logged_in?
  end
end
