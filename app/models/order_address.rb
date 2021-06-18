class OrderAddress
  include ActiveModel::Model
  attr_accessor :address, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id
end