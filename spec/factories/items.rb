FactoryBot.define do
  factory :item do
    item_name { Faker::Commerce.product_name }
    item_text { Faker::Lorem.sentence }
    item_category_id { Faker::Number.within(range: 2..10) }
    item_condition_id { Faker::Number.within(range: 2..7) }
    ship_charge_id { Faker::Number.within(range: 2..3) }
    area_id { Faker::Number.within(range: 2..48) }
    ship_day_id { Faker::Number.within(range: 2..4) }
    item_price { Faker::Number.within(range: 301..9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
