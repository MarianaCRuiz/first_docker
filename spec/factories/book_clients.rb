FactoryBot.define do
  factory :book_client do
    client
    book
    final_price { 12.3 }
  end
end
