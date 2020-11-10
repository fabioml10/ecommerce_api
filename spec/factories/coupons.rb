FactoryBot.define do
  factory :coupon do
    code { Faker::Commerce.unique.promotion_code(digits: 6) }
    status { %i(active inactive).sample }
    discount_value { rand(5.00..50.00) }
    due_date { "2020-11-10 00:22:31" }
  end
end
