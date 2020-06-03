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
  prefecture_code ="東京"
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
#productのサンプル

Product.create!(product_name:"洋梨のチーズタルト",
                category_id: 1,
                product_price:"1200",
                product_status: 1,
                product_image_id:"image/sample1",
                product_comment:"洋梨とチーズの相性がバッチリ")

Product.create!(product_name:"ザッハトルテ",
                category_id: 1,
                product_price:"2900",
                product_status: 1,
                product_comment:"チョコの濃厚な甘味が美味しい")

Product.create!(product_name:"いちごのショートケーキ",
                category_id: 1,
                product_price:"500",
                product_status: 1,
                product_comment:"王道のおいしさ")

Product.create!(product_name:"卵たっぷり濃厚プリン",
                category_id: 3,
                product_price:"500",
                product_status: 1,
                product_comment:"卵の味がしっかりする濃厚プリン")

Product.create!(product_name:"紅茶のクッキー",
                category_id: 2,
                product_price:"800",
                product_status: 1,
                product_comment:"茶葉をしっかり練り込んだクッキー")

Product.create!(product_name:"フルーツタルト",
                category_id: 1,
                product_price:"2900",
                product_status: 1,
                product_comment:"５種類のフルーツが入ってます")

Product.create!(product_name:"大きな桃のゼリー",
                category_id: 3,
                product_price:"480",
                product_status: 1,
                product_comment:"桃がまるごと入ったゼリー")

Product.create!(product_name:"マカロンセット(8個)",
                category_id: 2,
                product_price:"1200",
                product_status: 1,
                product_comment:"マカロン8個入り")

Product.create!(product_name:"マカロンセット(16個)",
                category_id: 2,
                product_price:"2000",
                product_status: 1,
                product_comment:"マカロン16個入り")

Product.create!(product_name:"バナナケーキ",
                category_id: 1,
                product_price:"980",
                product_status: 1,
                product_comment:"バナナ")

