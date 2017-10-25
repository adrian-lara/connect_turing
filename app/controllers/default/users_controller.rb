class Default::UsersController < Default::BaseController

  def edit
    if current_user.id == params[:id].to_i
      @user = current_user
    else
      render_404
    end
  end

end
