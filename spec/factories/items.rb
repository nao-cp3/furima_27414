FactoryBot.define do
  factory :item do
    name {"item"}
    text {"aaa"}
    prices {1000}
    category_id {2}
    condition_id {2}
    postage_id {2}
    prefecture_id {2}
    several_days_id {2}
    association :user
  end
end
