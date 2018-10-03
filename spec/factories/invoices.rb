FactoryBot.define do
  factory :invoice do
    status { "pending" }
    merchant { "Ollivanders" }
    customer { "Harry Potter" }
  end
end
