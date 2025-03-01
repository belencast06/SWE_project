class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  skip_before_action :verify_authenticity_token unless Rails.env.production?

  helper_method :current_user, :logged_in?
  
  def current_user
      @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
      !!current_user
  end
  
end
