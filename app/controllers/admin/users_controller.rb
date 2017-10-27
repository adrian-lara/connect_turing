class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @post_uri = admin_user_path(@user)
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)

    flash.notice = "User information has been updated!"

    redirect_to admin_user_path(user)
  end

  def destroy
    User.find(params[:id]).destroy

    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :slack,
                                 :email,
                                 :looking_for,
                                 :about_me,
                                 :availability_notes,
                                 :location_id,
                                 :username,
                                 :password,
                                 :gender_pronoun)
  end

end
