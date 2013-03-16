class Admin::UsersController < ApplicationController
  
  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    
  end
  
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to admin_users_path, :notice => "User deleted."
    else
      redirect_to admin_users_path, :notice => "Can't delete yourself."
    end
  end
end
