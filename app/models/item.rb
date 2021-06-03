class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :date_id, presence: true
  validates :selling_price, presence: true
  
  
  has_one_attached :image
end
