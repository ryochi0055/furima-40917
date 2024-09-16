FactoryBot.define do
    factory :item do
      association :user
      item_name { Faker::Name.last_name }
      explanation { Faker::Lorem.paragraph }
      category_id   { Faker::Number.between(from: 2, to: 11) }
      situation_id  { Faker::Number.between(from: 2, to: 8) }
      shipping_fee_id { Faker::Number.between(from: 2, to: 3) }
      prefecture_id { Faker::Number.between(from: 2, to: 48) }
      shipping_date_id { Faker::Number.between(from: 2, to: 4) }
      amount         { Faker::Number.between(from: 300, to: 9_999_999) }
  
      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
      end
  end
end
