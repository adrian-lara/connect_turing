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
