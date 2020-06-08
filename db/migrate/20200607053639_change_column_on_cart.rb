class ChangeColumnOnCart < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :carts, :user_id, false, 0
  	change_column_null :carts, :product_id, false, 0
  	change_column_null :carts, :number, false, 0
  end
end
