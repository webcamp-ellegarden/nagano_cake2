class ChangeColumnOnOrder < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :orders, :user_id, false, 0
  	change_column_null :orders, :postage, false, 0
  	change_column_null :orders, :total_price, false, 0
  	change_column_null :orders, :payment, false, 0
  	change_column_null :orders, :receiver, false, 0
  	change_column_null :orders, :postal_code, false, 0
  	change_column_null :orders, :delivery_address, false, 0
  	change_column_null :orders, :order_status, false, 0
  end
end
