require 'rails_helper'

describe "When an admin visits another users's show page" do
  before(:each) do
    @location = create(:location)
    @users = create_list(:user, 2, location: @location)
    MentorMentee.create(mentor: @users[0], mentee: @users[1], status: 0)
    @admin = create(:user, location: @location, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit admin_user_path(@users[0])
  end


  it "the admin can accept any mentorship requests that user has" do
    click_link "Accept", href: '/accept?mentee=2&mentor=1'

    expect(MentorMentee.first.status).to eq("Accepted")
  end

  it "the admin can reject any mentorship requests that user has" do
    click_link "Reject", href: '/reject?mentee=2&mentor=1'

    expect(MentorMentee.first.status).to eq("Rejected")
  end
end
