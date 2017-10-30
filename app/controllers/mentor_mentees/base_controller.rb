class MentorMentees::BaseController < ApplicationController

    def accept
      association = MentorMentee.find_by(mentor: params[:mentor], mentee: params[:mentee], status: 0)
      association.update(status: 1)

      flash.notice = "You are now a mentor for #{User.find(params[:mentee]).name}!"

      redirect_to user_path(params[:mentor])
    end

    def reject
    association = MentorMentee.find_by(mentor: params[:mentor], mentee: params[:mentee], status: 0)
    association.update(status: 2)


    flash.notice = "You've declined to mentor #{User.find(params[:mentee]).name}."

    redirect_to user_path(params[:mentor])
    end

    def request_mentorship
      MentorMentee.create(mentorship_params)

      flash.notice = "You've sent a request to #{User.find(params[:relation][:mentee_id]).name} to be your mentor."

      redirect_to user_path(params[:relation][:mentor_id])
    end

    private

  def mentorship_params
    params.require(:relation).permit(:mentor_id, :mentee_id)
  end

end
