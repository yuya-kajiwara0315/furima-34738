class Item < ApplicationRecord

with_options presence: true do
  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  validates :selling_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :image

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :prefecture_id
    validates :delivery_id
  end

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
