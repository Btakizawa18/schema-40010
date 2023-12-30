FactoryBot.define do
  factory :comment do
    association :user
    association :plan

    content { "Default Comment Content" }
  end
end
