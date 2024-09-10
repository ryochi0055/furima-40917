FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { "#{Faker::Internet.password(min_length: 6)}1a" }
    password_confirmation { password }
    first_name { 'いい' }
    last_name { 'ああ' }
    first_name_rub { 'カナ' }
    last_name_rub { 'カナ' }
    birthday { Faker::Date.birthday }
  end
end