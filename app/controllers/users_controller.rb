
class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_zpid

  def index
    @users = User.all
  end


  def load_zpid
    @zpid = Zpid.new
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
    @user = User.find(params[:id])
    @user.destroy
    flash[:alert] = "User has been deleted"
    redirect_to users_path
  end



  def authorize_user
    if !user_signed_in? || !current_user.admin?
      # raise ActionController::RoutingError.new("Not Found")
      redirect_to listings_path
    end
  end
end
