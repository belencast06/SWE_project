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
  # Rails.logger.info "🚨 require_login triggered on: #{request.path}"
  def require_login
    unless logged_in?
      unless request.path.in?([ login_path, signup_path ])
        flash[:alert] ||= "Please log in first"
        redirect_to login_path
      end
    end
  end
end
