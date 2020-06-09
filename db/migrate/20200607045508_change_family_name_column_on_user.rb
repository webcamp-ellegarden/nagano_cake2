class ChangeFamilyNameColumnOnUser < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :users, :family_name, false, 0
    change_column_null :users, :first_name, false, 0
    change_column_null :users, :family_name_kana, false, 0
    change_column_null :users, :first_name_kana, false, 0
    change_column_null :users, :tel, false, 0
    change_column_null :users, :postal_code, false, 0
    change_column_null :users, :prefecture_code, false, 0
    change_column_null :users, :address_city, false, 0
    change_column_null :users, :address_street, false, 0
    change_column_null :users, :user_status, false, 0
  end
end
