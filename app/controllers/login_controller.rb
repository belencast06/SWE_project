class LoginController < ApplicationController
  def index
  end

  def destroy
    reset_session # Logs out the user by clearing the session
    redirect_to login_path, notice: "Logged out successfully."
  end
end
