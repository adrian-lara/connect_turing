class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Log In Successful!"
      redirect_to user_path(user)
    else
      flash[:notice] = "Log In Failed!"
      render :new
    end
  end

  def destroy
    session.clear

    flash[:notice] = "Log Out Successful!"
    redirect_to root_path
  end
end
