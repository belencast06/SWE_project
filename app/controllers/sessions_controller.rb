class SessionsController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create ]

  def new
    flash.clear
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:just_logged_in] = true
      redirect_to home_path
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Successfully logged out!"
  end
end
