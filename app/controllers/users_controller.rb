class UsersController < ApplicationController
  def show
    skip_authorization
    @user = User.find(params[:id])
  end

  def edit
    skip_authorization
    @user = User.find(params[:id])
  end

  def update
    skip_authorization
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    redirect_to user_path(@user)
    else
      render 'users/show'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :photo, :photo_cache)
  end
end
