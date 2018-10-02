FactoryBot.define do
  factory :item do
    name { "Some Scary Magic" }
    description { "Just give up your soul" }
    unit_price { 1 }
    merchant_id {1}
  end
end
