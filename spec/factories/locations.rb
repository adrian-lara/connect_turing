FactoryBot.define do
  factory :location do
    sequence(:description) { |n| "Location #{n}" }
  end
end
