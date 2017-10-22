FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User Name #{n}" }
    sequence(:slack) { |n| "Slack Handle #{n}" }
    sequence(:looking_for) { |n| ["Mentor", "Mentee"].sample }
  end
end
