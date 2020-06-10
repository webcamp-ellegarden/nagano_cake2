FactoryBot.define do
  factory :order_details do
    making_status { 0 }
    number { 3 }
    product_price { 1620 }
    product
    order
  end
end