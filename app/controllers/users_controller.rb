class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to 'new'
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  def login

  end

  def logout

  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end

end