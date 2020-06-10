FactoryBot.define do
  factory :user do
    family_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    family_name_kana { Faker::Name.last_name }
    first_name_kana { Faker::Name.first_name }
    email { Faker::Internet.email }
    tel { '0000000000' }
    postal_code { '1250041'}
    prefecture_code { '東京' }
    address_city { Faker::Lorem.characters(number:5) }
    address_street { Faker::Lorem.characters(number:5) }
    password { 'password' }
    password_confirmation { 'password' }
  end
end