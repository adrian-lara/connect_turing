require 'rails_helper'

describe "When a default user visits another user's show page" do
  before(:each) do
    @location = create(:location)
    @users = create_list(:user, 2, location: @location)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@users[0])

    visit user_path(@users[1])
  end

  it "the user can see the Request Mentorship link" do
    expect(page).to have_link("Request Mentorship")
  end

  it "the logged in user can create a request for this user to be the logged in user's mentor" do
    click_on "Request Mentorship"

    expect(MentorMentee.first.mentor_id).to eq(@users[1].id)
    expect(MentorMentee.first.mentee_id).to eq(@users[0].id)
    expect(MentorMentee.first.status).to eq("Requested")

    expect(current_path).to eq(user_path(@users[1]))
  end
end
