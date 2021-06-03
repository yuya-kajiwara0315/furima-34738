class Item < ApplicationRecord

with_options presence: true do
  validates :name
  validates :description
  validates :category_id
  validates :condition_id
  validates :charge_id
  validates :prefecture_id
  validates :date_id
  validates :selling_price
end
  
  belongs_to :user
  has_one_attached :image
end
