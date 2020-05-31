class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :postage
      t.integer :total_price
      t.integer :payment
      t.string :receiver
      t.string :postal_code
      t.string :delivery_address
      t.integer :order_status

      t.timestamps
    end
  end
end
