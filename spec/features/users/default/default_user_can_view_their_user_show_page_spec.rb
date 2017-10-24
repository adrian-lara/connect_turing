require 'rails_helper'

describe "When a default user visits their own user show page" do
  it "the visitor sees all of their information as well as an edit and delete link" do
    location = create(:location)
    users = create_list(:user, 2, location: location)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(users[0])

    visit user_path(users[1])

    expect(page).to have_content(users[1].username)
    expect(page).to have_content(users[1].name)
    expect(page).to have_content(users[1].slack)
    expect(page).to have_content(users[1].email)
    expect(page).to have_content(users[1].location.description)
    expect(page).to have_content(users[1].gender_pronoun)
    expect(page).to have_content(users[1].looking_for)
    expect(page).to have_content(users[1].about_me)
    expect(page).to have_content(users[1].availability_notes)
    expect(page).to have_content("Since Last Activity: ")
    expect(page).not_to have_link("Edit")
    expect(page).not_to have_link("Delete")
  end
end

describe "When a default user visits their own user show page" do
  it "the visitor sees all of their information as well as an edit and delete link" do
    location = create(:location)
    users = create_list(:user, 2, location: location)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(users[0])

    visit user_path(users[0])

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