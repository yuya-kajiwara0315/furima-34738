class OrderAddress
  include ActiveModel::Model
  attr_accessor :address, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :address,       format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city,          format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください'}
    validates :house_number
    validates :phone_number,  format: {with: /\A[0-9]{10,11}\z/}

    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    # 商品情報を保存して変数orderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # 
    Address.create(address: address, prefecture_id: prefecture_id, city: city, house_number: house_number, phone_number: phone_number)
  end
end