require 'rails_helper'

describe "When a guest visits the user index, clicks on a UserName link" do
  it "the guest can now see the user show page" do
    location = create(:location)
    user = create(:user, location: location)

    visit users_path
    click_on "#{user.name}"

    expect(page).to have_content(user.username)
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.slack)
    expect(page).to have_content(user.email)
    expect(page).to have_content(user.location.description)
    expect(page).to have_content(user.gender_pronoun)
    expect(page).to have_content(user.looking_for)
    expect(page).to have_content(user.about_me)
    expect(page).to have_content(user.availability_notes)
    expect(page).to have_content("Since Last Activity: ")
    expect(page).not_to have_link("Edit")
    expect(page).not_to have_link("Delete")
    expect(page).not_to have_link("Request Mentorship")
  end
end
