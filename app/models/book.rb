class Book < ApplicationRecord
  has_many :book_clients
  has_many :clients, through: :book_clients
end
