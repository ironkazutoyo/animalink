FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    gender_id             { Faker::Number.within(range: 1..4) }
    birthday              { '1990/12/17' }
  end
end