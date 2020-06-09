class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

#アソシエーション----------------------------------------------------------------------
has_many :orders, dependent: :destroy
has_many :delivery_addresses, dependent: :destroy
  #カート部分--------------------------------
  has_many :carts, dependent: :destroy
  has_many :products, through: :carts
  #----------------------------------------

# validation
  validates :family_name, presence:true
  validates :first_name, presence:true
  validates :family_name_kana, presence:true
  validates :first_name_kana, presence:true
  validates :tel, presence:true
  validates :postal_code, presence:true
  validates :prefecture_code, presence:true
  validates :address_city, presence:true
  validates :address_street, presence:true
  validates :user_status, presence:true
#user_status
enum user_status:{ 有効: 0 , 退会済み: 1 }
attribute :user_status, :integer, default: 0

def active_for_authentication?
  super && (self.user_status == "有効" )
end


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

#名前カラムの連結
def user_fullname
  [self.family_name, self.first_name].compact.join
end

end
