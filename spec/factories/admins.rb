FactoryBot.define do
  factory :admin do
    email { 'hoho@hoho' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end