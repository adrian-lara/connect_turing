require 'rails_helper'

describe "When an admin visits the user index, clicks edit, changes information, and clicks Update User" do
  it "the admin has edited the user and is brought to the user's show page" do
    user = create(:user)

    visit users_path
    click_link "Edit", href: edit_user_path(user)
    fill_in "user[slack]", with: "BrandNewSlackHandle"
    click_on "Update User"

    expect(User.first.slack).to eq("BrandNewSlackHandle")
    expect(current_path).to eq(user_path(user))
    within('.page-title') do
      expect(page).to have_content(user.name)
    end
  end
end
