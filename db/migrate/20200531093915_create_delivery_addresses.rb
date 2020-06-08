class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.integer :user_id
      t.string :receiver
      t.string :portal_code
      t.string :prefecture_code
      t.string :address_city
      t.string :address_street
      t.string :address_building

      t.timestamps
    end
  end
end
