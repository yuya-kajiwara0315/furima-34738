class Item < ApplicationRecord

with_options presence: true do
  validates :name
  validates :description
  validates :category_id
  validates :condition_id
  validates :charge_id
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :date_id
  validates :selling_price
end
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
