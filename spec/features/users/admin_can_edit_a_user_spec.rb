require 'rails_helper'

describe "When an admin visits the user index, clicks edit, changes information, and clicks Update User" do
  it "the admin has edited the user and is brought to the user's show page" do
    location = create(:location)
    user = create(:user, location: location)

    visit users_path

    click_link "Edit", href: edit_user_path(user)

    fill_in "user[username]", with: "adrian-lara"
    fill_in "user[password]", with: "pwtest"
    fill_in "user[name]", with: "Adrian Lara"
    fill_in "user[slack]", with: "adrian-lara"
    fill_in "user[email]", with: "adrianblara@gmail.com"
    select "Mentor", from: "user[looking_for]"
    select location.description, from: "user[location_id]"
    fill_in "user[gender_pronoun]", with: "They/Them"
    fill_in "user[about_me]", with: "I like to learn and help others learn where I can."
    fill_in "user[availability_notes]", with: "I'm pretty flexible!"

    click_on "Update User"


    expect(User.first.username).to eq("adrian-lara")

    expect(User.first.name).to eq("Adrian Lara")
    expect(User.first.slack).to eq("adrian-lara")
    expect(User.first.email).to eq("adrianblara@gmail.com")
    expect(User.first.looking_for).to eq("Mentor")
    expect(User.first.location).to eq(location)
    expect(User.first.gender_pronoun).to eq("They/Them")
    expect(User.first.about_me).to eq("I like to learn and help others learn where I can.")
    expect(User.first.availability_notes).to eq("I'm pretty flexible!")

    expect(current_path).to eq(user_path(user))
    expect(page).not_to have_content(user.name)
  end
end
