require 'rails_helper'

describe "When a default user" do

  before(:each) do
    @location = create(:location)
    @users = create_list(:user, 5, location: @location)
    MentorMentee.create(mentor: @users[1], mentee: @users[0], status: 1)
    MentorMentee.create(mentor: @users[0], mentee: @users[2], status: 1)
    MentorMentee.create(mentor: @users[3], mentee: @users[0], status: 0)
    MentorMentee.create(mentor: @users[0], mentee: @users[4], status: 0)
  end

  describe "visits another user's show page" do
    it "the default user sees all of the information without an edit and delete link as well as mentor info" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@users[0])

      visit user_path(@users[1])

      expect(page).to have_content(@users[1].username)
      expect(page).to have_content(@users[1].name)
      expect(page).to have_content(@users[1].slack)
      expect(page).to have_content(@users[1].email)
      expect(page).to have_content(@users[1].location.description)
      expect(page).to have_content(@users[1].gender_pronoun)
      expect(page).to have_content(@users[1].looking_for)
      expect(page).to have_content(@users[1].about_me)
      expect(page).to have_content(@users[1].availability_notes)
      expect(page).to have_content("Since Last Activity: ")
      expect(page).not_to have_link("Edit")
      expect(page).not_to have_link("Delete")

      expect(page).not_to have_link(@users[1].mentees.first.name)
    end
  end

  describe "visits their own user show page" do
    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@users[0])

      visit user_path(@users[0])
    end

    it "the default user sees all of their information as well as an edit and delete link" do
      expect(page).to have_content(@users[0].username)
      expect(page).to have_content(@users[0].name)
      expect(page).to have_content(@users[0].slack)
      expect(page).to have_content(@users[0].email)
      expect(page).to have_content(@users[0].location.description)
      expect(page).to have_content(@users[0].gender_pronoun)
      expect(page).to have_content(@users[0].looking_for)
      expect(page).to have_content(@users[0].about_me)
      expect(page).to have_content(@users[0].availability_notes)
      expect(page).to have_content("Since Last Activity: ")
      expect(page).to have_link("Edit")
      expect(page).to have_link("Delete")
    end

    it "the default user can see accepted mentor and mentee relationships" do
      expect(page).to have_content("Mentors (1)")
      expect(page).to have_link(@users[0].accepted_mentors.first.name)
      expect(page).to have_content(@users[0].accepted_mentors.first.slack)
      expect(page).to have_content(@users[0].accepted_mentors.first.looking_for)

      expect(page).to have_content("Mentees (1)")
      expect(page).to have_link(@users[0].accepted_mentees.first.name)
      expect(page).to have_content(@users[0].accepted_mentees.first.slack)
      expect(page).to have_content(@users[0].accepted_mentees.first.looking_for)
    end

    it "the default user can see requested mentees (received request)" do
      expect(page).to have_content("Pending your response: (1)")
      expect(page).to have_link(@users[0].requested_mentees.first.name)
      expect(page).to have_content(@users[0].requested_mentees.first.slack)
      expect(page).to have_content(@users[0].requested_mentees.first.looking_for)
    end

    it "the default user can see requested mentors (sent request)" do
      expect(page).to have_content("Your requests: (1)")
      expect(page).to have_link(@users[0].requested_mentors.first.name)
      expect(page).to have_content(@users[0].requested_mentors.first.slack)
      expect(page).to have_content(@users[0].requested_mentors.first.looking_for)
    end
  end

end
