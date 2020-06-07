FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    introduction { Faker::Lorem.characters(number:20) }
    password { 'password' }
    password_confirmation { 'password' }
  end
end