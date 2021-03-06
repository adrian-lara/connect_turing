require 'rails_helper'

describe "When an admin visits user index page and clicks Delete" do
  it "the user corresponding to that Delete link gets deleted, and the index page is refreshed" do
    location = create(:location)
    users = create_list(:user, 2, location: location )
    admin = create(:user, location: location, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    click_link "Delete", href: admin_user_path(users[0])

    expect(User.count).to eq(2)
    expect(User.first.name).to eq(users[1].name)
    expect(current_path).to eq(admin_users_path)
  end
end

describe "When an admin visits user index page and clicks Delete" do
  it "the user corresponding to that Delete link gets deleted, and the index page is refreshed" do
    location = create(:location)
    users = create_list(:user, 2, location: location )
    admin = create(:user, location: location, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_user_path(users[0])

    click_link "Delete"

    expect(User.count).to eq(2)
    expect(User.first.name).to eq(users[1].name)
    expect(current_path).to eq(admin_users_path)
  end
end
