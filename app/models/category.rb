class Category < ApplicationRecord
  #ステータスのenum
  enum category_status:{'有効':0,'無効':1}
  
  validates :name, presence: true
  validates :category_status, presence: true

  has_many :products
  attribute :category_status, :integer, default: 0

end
