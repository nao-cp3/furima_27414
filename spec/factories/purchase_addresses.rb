FactoryBot.define do
  factory :purchase_address do
    postal_code {"123-4567"}
    prefecture_id {2}
    city {"品川区"}
    address {1-1-1}
    telephone {"08012345678"}
  end
end
