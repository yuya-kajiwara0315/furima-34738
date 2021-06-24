class Order < ApplicationRecord
  has_one :addresss
  belongs_to :item
  belongs_to :user

  # attr_accessor :token
end
