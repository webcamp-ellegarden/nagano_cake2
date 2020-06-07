class DeliveryAddress < ApplicationRecord
  belongs_to :user


  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
   self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  def connect_address
    [self.prefecture_name, self.address_city, self.address_street, self.address_building].compact.join
  end
#住所選択のプルダウン用
  def pulldown_content
    [self.postal_code, self.connect_address, self.receiver ].compact.join(" ")
  end
  #プルダウンで使うように配列に入れる。
  def pullarray_address
    [self.pulldown_content, self.id ]
  end

end
