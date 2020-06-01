class Category < ApplicationRecord
  #ステータスのenum
  enum category_status:{'有効':0,'無効':1}
  
  validates :name, presence: true
  

end
