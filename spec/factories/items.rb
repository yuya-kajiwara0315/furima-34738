FactoryBot.define do

  factory :item do
    name           { '商品テスト' }
    description    { '商品テストです。' }
    category_id    { 2 }
    condition_id   { 2 }
    charge_id      { 2 }
    prefecture_id  { 2 }
    delivery_id    { 2 }
    selling_price  { 300 }
    user_id        { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end

end
