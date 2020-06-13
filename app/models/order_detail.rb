class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum making_status:{'着手不可':0,'製作待ち':1,'製作中':2,'製作完了':3 }
  attribute :making_status, :integer, default: 0


# 税込み
  def tax_included
  	self.product_price.to_f * 1.08
  end
# 小計
  def subtotal
  	self.tax_included * self.number
  end

end
