require 'rails_helper'

describe "When an admin visits '/users/new', enters user information, and clicks on 'Create User'" do
  it "a new user has been created" do
    location = create(:location)
    visit new_user_path

    fill_in "user[name]", with: "Adrian Lara"
    fill_in "user[slack]", with: "adrian-lara"
    fill_in "user[email]", with: "adrianblara@gmail.com"
    select "Mentor", from: "user[looking_for]"
    select "Location 1", from: "user[location_id]"
    fill_in "user[about_me]", with: "I like to learn and help others learn where I can."
    fill_in "user[availability_notes]", with: "I'm pretty flexible!"
    click_on "Create User"

    expect(User.count).to eq(1)
    expect(User.last.name).to eq("Adrian Lara")
    expect(User.last.slack).to eq("adrian-lara")
    expect(User.last.availability_notes).to eq("I'm pretty flexible!")
    expect(current_path).to eq(users_path)
    expect(page).to have_link("Adrian Lara")
    expect(page).to have_content("Mentor")
  end
end
