class Default::UsersController < Default::BaseController

  def show

  end

  def edit
    if current_user.id == params[:id].to_i
      @user = current_user
    else
      render_404
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)

    redirect_to default_user_path(user)
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
