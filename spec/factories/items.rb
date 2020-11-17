FactoryBot.define do
  factory :item do
    name              { "花" }
    description       { "きれいな花です" }
    category_id       { "3" }
    condition_id      { "2" }
    delivary_fee_id   { "2" }
    prefecture_id     { "2" }
    days_to_ship_id   { "3" } 
    price             { "500" }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
