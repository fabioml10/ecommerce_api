FactoryBot.define do
  factory :system_requirement do
    sequence(:name) { |n| "Basic #{n}" }
    sequence(:os) { Faker::Computer.os }
    sequence(:storage) { "500GB" }
    sequence(:processor) { "Intel Core I5" }
    sequence(:memory) { "4GB" }
    sequence(:video_board) { "GeForce GTX" }
  end
end
