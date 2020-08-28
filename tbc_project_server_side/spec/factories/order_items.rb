FactoryBot.define do
  factory :order_item do
    quantity { 1 }
    product_id { 1 }
    order_id { 1 }
    total { "9.99" }
    unit_price { "9.99" }
  end
end
