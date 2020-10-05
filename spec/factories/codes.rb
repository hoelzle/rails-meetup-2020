FactoryBot.define do
  factory :code do
    sequence(:name) { |n| ('A'..'Z').to_a[(n - 1) % 26] }
    discount { [0, 10, 20, 30, 40, 50, 60].sample }

    kind { :basic }
    trait :basic

    trait :actual do
      kind { :actual }
    end

    trait :maximal do
      kind { :maximal }
    end
  end
end
