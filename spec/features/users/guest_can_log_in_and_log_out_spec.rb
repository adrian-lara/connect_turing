require 'rails_helper'

describe "When a guest visits root, clicks Log In, submits information, and clicks Log Out" do
  it "the user has logged in, viewed their show page, logged out, and is redirected to root" do
    location = create(:location)
    user = create(:user, location: location)
    visit root_path

    click_on "Log In"
    expect(current_path).to eq(login_path)

    fill_in 'user[username]', with: "username-1"
    fill_in 'user[password]', with: "password-1"
    click_on "Sign In"

    expect(session[:user_id]).to eq(1)
    expect(current_path).to eq(user_path(user))

    click_on "Log Out"

    expect(session[:user_id]).to be(nil)
    expect(current_path).to eq(root_path)
  end
end
