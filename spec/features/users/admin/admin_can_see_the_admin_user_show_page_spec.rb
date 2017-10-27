require 'rails_helper'

describe "When an admin visits the user index, clicks on a user's name" do
  it "the admin sees some user info as well as buttons to edit and delete the user" do
    location = create(:location)
    user = create(:user, location: location)
    admin = User.create(username: 'admin',
                        password: 'pass',
                        name: "Person",
                        role: 1
                       )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit users_path
    click_link "#{user.name}"

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
    expect(page).to have_link("Edit")
    expect(page).to have_link("Delete")
  end
end
