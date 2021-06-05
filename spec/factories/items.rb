FactoryBot.define do

  factory :item do
    name           { '商品テスト' }
    description    { '商品テストです。' }
    category_id    { '2' }
    condition_id   { '2' }
    charge_id      { '2' }
    prefecture_id  { '2' }
    delivery_id    { '2' }
    selling_price  { '2' }
    user_id        { '2' }
  end

end
