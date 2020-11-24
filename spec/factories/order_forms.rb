FactoryBot.define do
  factory :order_form do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {'111-1111'}
    prefecture_id {'2'}
    city {'江東区'}
    house_number {'1-1-1'}
    phone {'00011112222'}
  end
end
