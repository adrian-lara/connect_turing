require 'rails_helper'

describe "When an admin visits '/admin/users'" do
  it "a list of users and several details is shown on the page, as well as edit and delete buttons" do
    location = create(:location)
    users = create_list(:user, 4, location: location)
    admin = create(:user, location: location, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    expect(page).to have_link(users[0].name)
    expect(page).to have_link(users[1].name)
    expect(page).to have_link("Delete", href: admin_user_path(users[0]))
    expect(page).to have_link("Delete", href: admin_user_path(users[1]))
    expect(page).to have_link("Edit", href: edit_admin_user_path(users[0]))
    expect(page).to have_link("Edit", href: edit_admin_user_path(users[1]))
    expect(page).to have_content(users[2].slack)
    expect(page).to have_content(users[3].slack)
    expect(page).to have_content(users[2].looking_for)
    expect(page).to have_content(users[3].looking_for)
  end
end
