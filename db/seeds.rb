#ジャンルのサンプル
Category.create!(name:"ケーキ",
                  category_status: 0)

Category.create!(name:"焼き菓子",
                  category_status: 0)

Category.create!(name:"プリン",
                  category_status: 0)

Category.create!(name:"キャンディ",
                  category_status: 0)

#aeminのサンプル
Admin.create!(email: "hoge@hoge",
             password: "password")

#userのサンプル
9.times do |n|
  family_name  = "佐藤"
  first_name = "太郎#{n+1}"
  family_name_kana  = "サトウ"
  first_name_kana = "タロウ#{n+1}"
  tel  = Faker::Code.sin
  postal_code = "111111#{n+1}"
  prefecture_code ="東京都"
  address_city = "練馬区平和台"
  address_street = "1-1-1"
  address_building = "かっこいいビル1F"
  user_status = 0
  email = "foo#{n+1}@hoge"
  password = "password"

  User.create!(
               email:  email,
               password:              password,
               password_confirmation: password,
               family_name: family_name,
               first_name: first_name,
               family_name_kana:  family_name_kana,
               first_name_kana:first_name_kana,
               tel: tel,
               postal_code: postal_code,
               prefecture_code: prefecture_code,
               address_city: address_city,
               address_street: address_street ,
               address_building: address_building,
               user_status: user_status)
end