require 'rails_helper'

describe "When a default user visits the index" do
  it "the user sees Account and Log Out links in the nav bar" do
    location = create(:location)
    user = create(:user, location: location)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit users_path

    expect(page).to have_link("Account", href: user_path(user))
    expect(page).to have_link("Log Out", href: logout_path)
  end
end
