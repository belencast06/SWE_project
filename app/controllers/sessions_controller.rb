class SessionsController < ApplicationController
  def new
  end

  def create
    session[:user] = {
      email: params[:email],
      password: params[:password] # Only for testing purposes
    }
    redirect_to home_path, notice: "Logged in successfully!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out successfully!"
  end
end
