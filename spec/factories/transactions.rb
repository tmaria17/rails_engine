FactoryBot.define do
  factory :transaction do
    invoice { create(:invoice).id}
    credit_card_number { "MyString" }
    credit_card_expiration_date { "MyString" }
    result { "Successful" }
  end
end
