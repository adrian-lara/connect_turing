class Default::UsersController < Default::BaseController

  def edit
    if current_user.id == params[:id].to_i
      @user = current_user
      @post_uri = default_user_path(@user)
    else
      render_404
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)

    flash.notice = "User information has been updated!"

    redirect_to user_path(user)
  end

  def destroy
    session.clear
    User.find(params[:id]).destroy

    flash.notice = "User has been deleted."

    redirect_to users_path
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
