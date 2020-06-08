class RenamePortalCodeColumnToDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
  	rename_column :delivery_addresses, :portal_code, :postal_code
  end
end
