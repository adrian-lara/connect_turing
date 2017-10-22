require 'rails_helper'

describe "When a visitor visits '/users'" do
  it "a list of users and several details is shown on the page" do
    users = create_list(:user, 4)
    visit users_path

    expect(page).to have_link(users[0].name)
    expect(page).to have_link(users[1].name)
    expect(page).to have_content(users[2].slack)
    expect(page).to have_content(users[3].slack)
    expect(page).to have_content("Mentor")
    expect(page).to have_content("Mentee")
  end
end
