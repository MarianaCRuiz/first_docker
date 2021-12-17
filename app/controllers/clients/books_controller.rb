class Clients::BooksController < ApplicationController
  before_action :authenticate_client!

  def index
    @client = current_client
    @books = @client.books
    @books_client = BookClient.where(client: @client)
  end
end
