require 'rails_helper'

describe User do
  it "can be created" do
    User.new
  end

  it { should belong_to(:location) }
end
