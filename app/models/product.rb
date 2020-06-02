class Product < ApplicationRecord
  attachment :product_image

#アソシエーション----------------------------------
  has_many :order_details
  # belongs_to :category
  #カート部分
  has_many :carts
  has_many :users, through: :carts
end
