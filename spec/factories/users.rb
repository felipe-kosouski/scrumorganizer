FactoryBot.define do
  factory :user do
    name 'Felipe Kosouski'
    username 'felipe_123'
    sequence(:email) { |n| "user#{n}@example.com.br" }
    password 'password'
    password_confirmation 'password'
  end
end