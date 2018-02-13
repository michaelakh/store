FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password "12345678"
    password_confirmation "12345678"
    
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    county  Faker::Address.country
    country  Faker::Address.country
    postcode  Faker::Address.postcode
    street_ad  Faker::Address.street_address
    town_city  Faker::Address.city
    phone_no  Faker::PhoneNumber.phone_number
  end
end