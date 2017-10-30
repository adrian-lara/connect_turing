require 'rails_helper'

describe "When an admin visits the page of another user" do
  it "the admin can request a mentorship from that user" do
    location = create(:location)
    user = create(:user, location: location)
    admin = create(:user, location: location, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit user_path(user)

    click_on "Request Mentorship"

    expect(MentorMentee.first.mentor_id).to eq(user.id)
    expect(MentorMentee.first.mentee_id).to eq(admin.id)
    expect(MentorMentee.first.status).to eq("Requested")
  end
end
