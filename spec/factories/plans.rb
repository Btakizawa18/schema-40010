FactoryBot.define do
  factory :plan do
    association :user

    title { "Default Title" }
    detail { "Default Detail" }
    goal { "Default Goal" }
    start_time { Time.now }
  end
end
