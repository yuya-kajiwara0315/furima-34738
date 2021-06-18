class Order < ApplicationRecord
  has_one :addresss
  belongs_to :item
end
