class ChangeReceiverColumnOnDeliveryAddress < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :delivery_addresses, :user_id, false, 0
  	change_column_null :delivery_addresses, :receiver, false, 0
    change_column_null :delivery_addresses, :postal_code, false, 0
    change_column_null :delivery_addresses, :prefecture_code, false, 0
    change_column_null :delivery_addresses, :address_city, false, 0
    change_column_null :delivery_addresses, :address_street, false, 0
  end
end
