class ChangeColumnOnProduct < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :products, :category_id, false, 0
  	change_column_null :products, :product_name, false, 0
  	change_column_null :products, :product_price, false, 0
  	change_column_null :products, :product_status, false, 0
  	change_column_null :products, :product_comment, false, 0
  end
end
