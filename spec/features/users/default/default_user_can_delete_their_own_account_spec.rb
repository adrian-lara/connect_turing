require 'rails_helper'

describe "When a default user goes to their own show page and clicks delete" do
  it "the user has deleted their profile and is no longer signed in" do
    location = create(:location)
    user = create(:user, location: location)
    visit users_path
    click_on "Log In"
    expect(current_path).to eq(login_path)

    fill_in 'session[username]', with: user.username
    fill_in 'session[password]', with: user.password
    click_on "Sign In"

    visit user_path(user)

    click_link "Delete"

    expect(User.count).to eq(0)
    expect(current_path).to eq(users_path)

    expect(page).to have_link("Sign Up")
    expect(page).to have_link("Log In")
    expect(page).not_to have_link("Log Out")
    expect(page).not_to have_link("Account")
  end
end
