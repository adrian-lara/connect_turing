require 'rails_helper'

describe "When a default user visits another user's show page" do
  before(:each) do
    @location = create(:location)
    @users = create_list(:user, 2, location: @location)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@users[0])
  end

  it "the user can see the Request to be Mentor link" do
    visit user_path(@users[1])

    expect(page).to have_link("Request Mentorship")
  end
end
