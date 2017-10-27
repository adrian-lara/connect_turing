class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy

    redirect_to admin_users_path
  end

end
