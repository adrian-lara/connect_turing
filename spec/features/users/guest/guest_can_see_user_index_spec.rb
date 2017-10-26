require 'rails_helper'

describe "When a guest visits the user index page" do
  it "the guest sees a list of users and some of their details" do
    location = create(:location)
    users = create_list(:user, 2, location: location)

    visit users_path

    expect(page).to have_link(users[0].name)
    expect(page).to have_link(users[1].name)
    expect(page).not_to have_link("Delete", href: user_path(users[0]))
    expect(page).not_to have_link("Delete", href: user_path(users[1]))
    expect(page).not_to have_link("Edit", href: edit_user_path(users[0]))
    expect(page).not_to have_link("Edit", href: edit_user_path(users[1]))
    expect(page).to have_content(users[0].slack)
    expect(page).to have_content(users[1].slack)
    expect(page).to have_content(users[0].looking_for)
    expect(page).to have_content(users[1].looking_for)

  end
end
