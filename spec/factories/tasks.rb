FactoryBot.define do
  factory :task do
    datetime { DateTime.now }
    title { Faker::Lorem.sentence }
    content                 { Faker::Lorem.sentence }
    task_type_id              { 2 }
    notice_id { Faker::Number.within(range: 1..2) }
    association :user

  end
end