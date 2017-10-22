require 'rails_helper'

describe "When a visitor visits '/users'" do
  it "a list of users is shown on the page" do
    
    visit users_path


  end
end
