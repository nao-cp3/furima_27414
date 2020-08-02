FactoryBot.define do
  factory :item do
    #image {File.open("#{Rails.root}/public/images/test_image.jpg")}
    name {"item"}
    text {"aaa"}
    prices {1000}
  end
end
