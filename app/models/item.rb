class Item < ApplicationRecord

with_options presence: true do
  validates :name
  validates :description
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :delivery_id, numericality: { other_than: 1 }
  validates :selling_price
  validates :image
end
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :delivery
  belongs_to :charge
  belongs_to :category
  belongs_to :condition
  
end
