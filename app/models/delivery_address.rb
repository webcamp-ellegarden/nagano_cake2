class DeliveryAddress < ApplicationRecord
  belongs_to :user
  
  def delivery_address
    [self.prefecture_name, self.address_city, self.address_street, self.address_building].compact.join
  end
end
