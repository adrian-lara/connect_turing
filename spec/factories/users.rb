FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "username-#{n}" }
    sequence(:password) { |n| "password-#{n}" }
    sequence(:name) { |n| "User Name #{n}" }
    sequence(:slack) { |n| "Slack Handle #{n}" }
    sequence(:email) { |n| "email_#{n}@mail.com" }
    sequence(:looking_for) { |n| ["Mentor", "Mentee", "Mentor & Mentee", "Neither"][4 % n] }
    sequence(:gender_pronoun) { |n| ["He/Him", "Her/She", "Them/They"][3 % n] }
    sequence(:about_me) { |n| "About text #{n}." }
    sequence(:availability_notes) { |n| "Availability Notes #{n}." }
  end
end
