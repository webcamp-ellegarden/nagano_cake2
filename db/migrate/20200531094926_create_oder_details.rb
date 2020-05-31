class CreateOderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :oder_details do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :making_status
      t.integer :number
      t.integer :product_price

      t.timestamps
    end
  end
end
