require 'rails_helper'

describe "When a default user visits their show page" do
  before(:each) do
    @location = create(:location)
    @users = create_list(:user, 3, location: @location)
    @relation_1 = MentorMentee.create(mentor: @users[1], mentee: @users[0], status: 0)
    @relation_2 = MentorMentee.create(mentor: @users[0], mentee: @users[2], status: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@users[0])

    visit user_path(@users[0])
  end

  it "the default user can accept a mentor request from others" do
    click_on "Accept"

    expect(MentorMentee.second.status).to eq("Accepted")
    expect(current_path).to eq(user_path(@users[0]))
  end

  it "the default user can reject a mentor request from others" do
    click_on "Reject"

    expect(MentorMentee.second.status).to eq("Rejected")
    expect(current_path).to eq(user_path(@users[0]))
  end
end
