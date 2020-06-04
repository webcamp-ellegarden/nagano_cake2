class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :family_name, :string
    add_column :users, :first_name, :string
    add_column :users, :family_name_kana, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :tel, :string
  	add_column :users, :postal_code, :string
    add_column :users, :prefecture_code, :string
    add_column :users, :address_city, :string
    add_column :users, :address_street, :string
    add_column :users, :address_building, :string
    add_column :users, :user_status, :integer, default: 0
  end
end
