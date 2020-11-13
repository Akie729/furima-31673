FactoryBot.define do
  factory :user do
    name                  { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { 'ぜんかく' }
    first_name            { 'ぜんかく' }
    last_name_kana        { 'ゼンカクカナ' }
    first_name_kana       { 'ゼンカクカナ' }
    birth_date            { Faker::Date.backward }
  end
end
