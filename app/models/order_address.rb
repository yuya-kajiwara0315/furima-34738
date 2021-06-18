class OrderAddress
  include ActiveModel::Model
  attr_accessor :address, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :address,       format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city,          format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください'}
    validates :house_number,  format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください'}
    validates :phone_number,  format: {with: /\A0[0-9]{9,10}\z/}

    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

end