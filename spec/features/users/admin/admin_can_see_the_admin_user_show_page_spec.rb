require 'rails_helper'

describe "When an admin visits the user index, clicks on a user's name" do
  it "the admin sees some user info as well as buttons to edit and delete the user" do
    location = create(:location)
    users = create_list(:user, 5, location: location)
    MentorMentee.create(mentor: users[1], mentee: users[0], status: 1)
    MentorMentee.create(mentor: users[0], mentee: users[2], status: 1)
    MentorMentee.create(mentor: users[3], mentee: users[0], status: 0)
    MentorMentee.create(mentor: users[0], mentee: users[4], status: 0)
    admin = create(:user, location: location, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path
    click_link "#{users[0].name}"

    expect(page).to have_content(users[0].username)
    expect(page).to have_content(users[0].name)
    expect(page).to have_content(users[0].slack)
    expect(page).to have_content(users[0].email)
    expect(page).to have_content(users[0].location.description)
    expect(page).to have_content(users[0].gender_pronoun)
    expect(page).to have_content(users[0].looking_for)
    expect(page).to have_content(users[0].about_me)
    expect(page).to have_content(users[0].availability_notes)
    expect(page).to have_content("Since Last Activity: ")
    expect(page).to have_link("Edit")
    expect(page).to have_link("Delete")

    expect(page).to have_link("Request Mentorship")

    expect(page).to have_content("Mentors (1)")
    expect(page).to have_link(users[0].accepted_mentors.first.name)
    expect(page).to have_content(users[0].accepted_mentors.first.slack)
    expect(page).to have_content(users[0].accepted_mentors.first.looking_for)

    expect(page).to have_content("Mentees (1)")
    expect(page).to have_link(users[0].accepted_mentees.first.name)
    expect(page).to have_content(users[0].accepted_mentees.first.slack)
    expect(page).to have_content(users[0].accepted_mentees.first.looking_for)

    expect(page).to have_content("Pending your response: (1)")
    expect(page).to have_link(users[0].requested_mentees.first.name)
    expect(page).to have_content(users[0].requested_mentees.first.slack)
    expect(page).to have_content(users[0].requested_mentees.first.looking_for)

    expect(page).to have_content("Your requests: (1)")
    expect(page).to have_link(users[0].requested_mentors.first.name)
    expect(page).to have_content(users[0].requested_mentors.first.slack)
    expect(page).to have_content(users[0].requested_mentors.first.looking_for)
  end
end
