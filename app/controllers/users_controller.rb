class UsersController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create ]

  def new
    @user = User.new
  end

  def create
    puts "CREATE ACTION HIT"

    @user = User.new(user_params)
    if @user.save
      puts "User created successfully"
      session[:user_id] = @user.id
      redirect_to home_path, notice: "Signed up successfully!"
    else
      puts "User creation failed"
      puts @user.errors.full_messages
      flash.now[:alert] = "Sign up failed: #{@user.errors.full_messages.join(', ')}"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
