require 'rails_helper'

describe "When a visitor visits a user show page" do
  it "the visitor sees all of the user's information" do
    location = create(:location)
    user = create(:user, location: location)
    visit user_path(user)

    expect(page).to have_content(user.name)
    expect(page).to have_content(user.slack)
    expect(page).to have_content(user.email)
    expect(page).to have_content(user.looking_for)
    expect(page).to have_content(user.about_me)
    expect(page).to have_content(user.availability_notes)
    expect(page).to have_content("Since Last Activity: ")
  end
end
