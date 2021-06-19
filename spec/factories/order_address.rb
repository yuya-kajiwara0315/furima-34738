FactoryBot.define do
  factory :order_address do
    address { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    house_number { '１ー１' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
  end
end
