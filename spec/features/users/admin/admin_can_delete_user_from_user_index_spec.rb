require 'rails_helper'

describe "When an admin visits user index page and clicks Delete" do
  it "the user corresponding to that Delete link gets deleted, and the index page is refreshed" do
    location = create(:location)
    users = create_list(:user, 2, location: location )

    visit users_path
    click_link "Delete", href: user_path(users[0])

    expect(User.count).to eq(1)
    expect(User.first.name).to eq(users[1].name)
    expect(current_path).to eq(users_path)
  end
end
