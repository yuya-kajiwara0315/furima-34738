class Information < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :prefecture_id, numericality: { other_than: 1 } 
end
