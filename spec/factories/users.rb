FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "username-#{n}" }
    sequence(:password) { |n| "passwoord-#{n}" }
    sequence(:name) { |n| "User Name #{n}" }
    sequence(:slack) { |n| "Slack Handle #{n}" }
    sequence(:looking_for) { |n| ["Mentor", "Mentee"].sample }
  end
end
