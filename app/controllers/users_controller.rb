 
class UsersController < ApplicationController
  # before_action :authorize_user

  def index
    @users = User.all
  end

  def make_admin
    @user = User.find(params[:id])
    if @user.admin
      @user.update_attributes(admin: false)
    else
      @user.update_attributes(admin: true)
    end
    redirect_to users_path
  end

  def destroy
    @users = User.all
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User has been deleted"
    redirect_to users_path
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      # raise ActionController::RoutingError.new("Not Found")
      redirect_to listings_path
    end
  end
end
