require 'rails_helper'

describe "When an admin visits '/users'" do
  it "a list of users and several details is shown on the page" do
    location = create(:location)
    users = create_list(:user, 4, location: location)
    visit users_path

    expect(page).to have_link(users[0].name)
    expect(page).to have_link(users[1].name)
    expect(page).to have_link("Delete", href: user_path(users[0]))
    expect(page).to have_link("Delete", href: user_path(users[1]))
    expect(page).to have_link("Edit", href: edit_user_path(users[0]))
    expect(page).to have_link("Edit", href: edit_user_path(users[1]))
    expect(page).to have_content(users[2].slack)
    expect(page).to have_content(users[3].slack)
    expect(page).to have_content(users[2].looking_for)
    expect(page).to have_content(users[3].looking_for)
  end
end
