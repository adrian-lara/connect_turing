require 'rails_helper'

describe "When a default user visits the users index page" do
  it "the user sees the same index page as a non-logged in guest" do
    location = create(:location)
    users = create_list(:user, 2, location: location)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(users[1])

    visit users_path

    expect(page).to have_link(users[0].name)
    expect(page).to have_link(users[1].name)
    expect(page).not_to have_link("Delete", href: user_path(users[0]))
    expect(page).not_to have_link("Delete", href: user_path(users[1]))
    expect(page).not_to have_link("Edit", href: edit_default_user_path(users[0]))
    expect(page).not_to have_link("Edit", href: edit_default_user_path(users[1]))
    expect(page).to have_content(users[0].slack)
    expect(page).to have_content(users[1].slack)
    expect(page).to have_content(users[0].looking_for)
    expect(page).to have_content(users[1].looking_for)
  end
end

describe "When a default user visits '/admin/users'" do
  it "they are shown a '404 page not found' page" do
    location = create(:location)
    users = create_list(:user, 4, location: location)
    default_user = User.create(username: 'admin',
                        password: 'pass',
                        name: "Person"
                       )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

    visit admin_users_path

    expect(status_code).to eq(404)
  end
end
