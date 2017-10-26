require 'rails_helper'

describe "When a guest visits site" do
  it "the user can see Log In and Sign Up links in nav bar" do
    visit root_path

    expect(page).to have_link("Log In")
    expect(page).to have_link("Sign Up")
    expect(page).not_to have_link("Log Out")
    expect(page).not_to have_link("Account")
  end
end
