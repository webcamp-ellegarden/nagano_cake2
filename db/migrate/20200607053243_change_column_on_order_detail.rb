class ChangeColumnOnOrderDetail < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :order_details, :product_id, false, 0
  	change_column_null :order_details, :order_id, false, 0
  	change_column_null :order_details, :making_status, false, 0
  	change_column_null :order_details, :number, false, 0
  	change_column_null :order_details, :product_price, false, 0
  end
end
