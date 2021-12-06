class BookClient < ApplicationRecord
  belongs_to :client
  belongs_to :book
end
