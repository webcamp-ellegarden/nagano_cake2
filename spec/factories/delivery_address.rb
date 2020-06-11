FactoryBot.define do
  factory :delivery_address do

    receiver { Faker::Lorem.characters(number:10) }
    postal_code { '1250041'}
    prefecture_code { '東京' }
    address_city { Faker::Lorem.characters(number:5) }
    address_street { Faker::Lorem.characters(number:5) }
    user
  end
end