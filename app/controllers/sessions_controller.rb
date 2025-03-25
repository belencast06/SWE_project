class SessionsController < ApplicationController
  def new
  end

  def create
    session[:user] = {
      email: params[:email],
      password: params[:password]
    }
    redirect_to home_path, notice: "Logged in successfully!"
  end

  def destroy
    session[:user] = nil
    redirect_to login_path, notice: "Logged out successfully!"
  end
end
