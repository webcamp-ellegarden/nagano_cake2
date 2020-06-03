class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

#アソシエーション----------------------------------------------------------------------
    has_many :orders, dependent: :destroy
    has_many :delivery_addresses, dependent: :destroy
  #カート部分--------------------------------
    has_many :carts
    has_many :products, through: :carts
  #----------------------------------------

#  jp_prefecture用メソッド------------------------------------------------------------
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
   JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
   self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
# ----------------------------------------------------------------------------------

#住所カラムの連結
  def user_address
    [self.prefecture_name, self.address_city, self.address_street, self.address_building].compact.join
  end
#名前の連結(使い方： @user.user_fullname →　フルネームが表示される。)
  def user_fullname
    [self.family_name, self.first_name].compact.join
  end


end
