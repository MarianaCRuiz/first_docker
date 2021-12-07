class Clients::BooksController < ApplicationController
  def index
    @client = current_client
    @books = @client.books
    @books_client = BookClient.where(client: @client)
  end
end
