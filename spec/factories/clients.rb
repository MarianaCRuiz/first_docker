FactoryBot.define do
  factory :client do
    sequence(:email) { |n| "email#{n}@gmail.com" }
    password { 'abc123' }
  end
end
