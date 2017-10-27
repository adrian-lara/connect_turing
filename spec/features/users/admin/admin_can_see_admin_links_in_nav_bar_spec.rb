require 'rails_helper'

describe "When an admin visits admin users index" do
  it "the admin sees admin relevant links" do
    location = create(:location)
    admin = User.create(username: 'admin',
                        password: 'pass',
                        name: "Person",
                        location: location,
                        role: 1
                       )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    expect(page).to have_link("Connect Turing", href: admin_users_path)
    expect(page).to have_link("Account")
    expect(page).to have_link("Log Out")
    expect(page).not_to have_link("Sign In")
    expect(page).not_to have_link("Log In")
  end
end
