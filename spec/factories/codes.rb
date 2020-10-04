FactoryBot.define do
  factory :code do
    sequence(:name) { |n| ('A'..'Z').to_a[(n - 1) % 26] }
    discount { [0, 10, 20, 30, 40, 50, 60].sample }

    type { :basic }
    trait :basic

    trait :actual do
      type { :actual }
    end

    trait :maximal do
      type { :maximal }
    end
  end
end
