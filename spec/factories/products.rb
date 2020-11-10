FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price(range: 100.0..400.0) }

    after :build do |product|
      product.productable = create(:game) #cria facctory de game e associa com productable
    end
  end
end
