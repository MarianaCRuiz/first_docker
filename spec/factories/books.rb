FactoryBot.define do
  factory :book do
    sequence(:name) { |n| "Livro #{n}" }
    sequence(:author, 'a') { |letter| "Autor #{letter}" }
    sequence(:price) { |n| 10 + n }
    sequence(:discount) { |n| 10 + (n / 100) }
  end
end
