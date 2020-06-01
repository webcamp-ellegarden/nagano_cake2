class Product < ApplicationRecord
  attachment :product_image
  has_many :order_details
end
