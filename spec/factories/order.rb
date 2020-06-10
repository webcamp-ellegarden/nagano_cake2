FactoryBot.define do
  factory :order do

    total_price { '10000' }
    postage { '10000' }
    payment { 0 }
    order_status { 0 }
    postal_code { '1250041'}
    receiver { Faker::Lorem.characters(number:10) }
    delivery_address { Faker::Lorem.characters(number:5) }
    user
  end
end

