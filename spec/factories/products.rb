FactoryBot.define do
   factory :product do
    product_name { Faker::Lorem.characters(number:5) }
    product_price { '500' }
    product_status { 0 }
    product_comment { Faker::Lorem.characters(number:40) }
    category
  end
end