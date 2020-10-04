FactoryBot.define do
  factory :customer do
    sequence(:name) { |n| "Customer #{n}" }
    discount { [5, 10, 15, 20, 25, 30].sample }
  end
end
