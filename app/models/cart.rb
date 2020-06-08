class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product

  attribute :number, :integer, default: 1

  validates :number, presence:true

  def tax_included
  	self.product.product_price.to_f * 1.08
  end

  def subtotal
  	self.tax_included * self.number
  end
  
  # def total_price(carts)
  # 	carts.map(&:subtotal).sum.to_i
  # end
end
