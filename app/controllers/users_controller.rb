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

  def dashboard
    skip_authorization
    @user = current_user
    # @google_events = get_google_calendar_events
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :photo, :photo_cache)
  end

  def google_secret
    Google::APIClient::ClientSecrets.new(
      { "web" =>
        { "access_token" => @user.google_token,
          "refresh_token" => @user.google_refresh_token,
          "client_id" => Rails.application.secrets.google_client_id,
          "client_secret" => Rails.application.secrets.google_client_secret,
        }
      }
    )
  end
end
