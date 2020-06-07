class ChangeColumnOnCategory < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :categories, :name, false, 0
  	change_column_null :categories, :category_status, false, 0
  end
end
