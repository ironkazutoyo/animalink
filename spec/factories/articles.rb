FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    text                 { Faker::Lorem.sentence }
    pet_type_id              { Faker::Number.within(range: 2..20) }
    text_type_id { Faker::Number.within(range: 2..7) }
    publishing_setting_id { Faker::Number.within(range: 1..2) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/animal.jpg'), filename: 'flag.png')
    end
  end
end