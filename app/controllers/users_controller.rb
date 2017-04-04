class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "user created!"
      redirect_to products_path
    else
      flash[:alert] = "something went wrong!"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
  end
end
