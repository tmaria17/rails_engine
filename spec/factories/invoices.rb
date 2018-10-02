FactoryBot.define do
  factory :invoice do
    status { "MyString" }
    merchant { nil }
    customer { "" }
  end
end
