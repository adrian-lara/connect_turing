require 'rails_helper'

describe "When a guest visits root, clicks on Sign Up, enters user information, and clicks on 'Create User'" do
  it "a new user has been created and they are logged in" do
    location = create(:location)
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)

    fill_in "user[username]", with: "adrian-lara"
    fill_in "user[password]", with: "pwtest"
    fill_in "user[name]", with: "Adrian Lara"
    fill_in "user[slack]", with: "adrian-lara"
    fill_in "user[email]", with: "adrianblara@gmail.com"
    select "Mentor", from: "user[looking_for]"
    select location.description, from: "user[location_id]"
    fill_in "user[gender_pronoun]", with: "He/Him"
    fill_in "user[about_me]", with: "I like to learn and help others learn where I can."
    fill_in "user[availability_notes]", with: "I'm pretty flexible!"
    click_on "Create User"

    expect(User.count).to eq(1)
    expect(User.last.name).to eq("Adrian Lara")
    expect(User.last.slack).to eq("adrian-lara")
    expect(User.last.availability_notes).to eq("I'm pretty flexible!")
    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_link("Account")
    expect(page).to have_link("Log Out")
  end
end
