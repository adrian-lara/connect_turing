require 'rails_helper'

describe User do
  it "can be created" do
    User.new
  end

  it { should belong_to(:location) }

  describe "Instance Methods" do

    before(:each) do
      @location = create(:location)
      @users = create_list(:user, 5, location: @location)
      MentorMentee.create(mentor: @users[1], mentee: @users[0], status: 1)
      MentorMentee.create(mentor: @users[0], mentee: @users[2], status: 1)
      MentorMentee.create(mentor: @users[3], mentee: @users[0], status: 0)
      MentorMentee.create(mentor: @users[0], mentee: @users[4], status: 0)
    end

    describe "#accepted_mentors" do
      it "returns list of accepted mentors" do
        expect(@users[0].accepted_mentors).to eq([@users[1]])
      end

    end
  end
end
