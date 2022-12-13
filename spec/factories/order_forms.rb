FactoryBot.define do
  factory :order_form do
    post_code { '501-4567' }
    area_id { Faker::Number.within(range: 2..48) }
    municipality { '名古屋市中区' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '0575685696' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end