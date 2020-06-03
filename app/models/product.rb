class Product < ApplicationRecord
  attachment :product_image

#アソシエーション----------------------------------
  has_many :order_details
  belongs_to :category
  #カート部分
  has_many :carts
  has_many :users, through: :carts

  enum product_status:{'販売停止中':0,'販売中':1}

  def tax_included
  	self.product_price.to_f * 1.08
  end
end
