class LoginController < ApplicationController
  def index
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: "Logged in successfully"
    else
      flash[:alert] = "Invalid email or password"
      render :index
    end
  end


  def destroy
    reset_session # Logs out the user by clearing the session
    redirect_to login_path, notice: "Logged out successfully."
  end
end
