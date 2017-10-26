require 'rails_helper'

describe "When a guest tries to visit an edit user page" do
  it "the user is redirected to a page not found with a 404 error" do
    location = create(:location)
    user = create(:user, location: location)

    visit edit_default_user_path(user)

    expect(status_code).to eq(404)
  end
end
