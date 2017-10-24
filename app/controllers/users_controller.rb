class UsersController < ApplicationController

  def  index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash.notice = "Account created!"
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.notice = "Error creating account."
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)

    flash.notice = "User information has been updated!"

    redirect_to user_path(user)
  end

  def destroy
    User.find(params[:id]).destroy

    flash.notice = "User has been deleted."

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username,
                                 :password,
                                 :name,
                                 :slack,
                                 :email,
                                 :looking_for,
                                 :gender_pronoun,
                                 :about_me,
                                 :availability_notes,
                                 :location_id
                                )
  end

end
