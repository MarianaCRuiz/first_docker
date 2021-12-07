class Book < ApplicationRecord
  has_many :book_clients, dependent: false
  has_many :clients, through: :book_clients
end
