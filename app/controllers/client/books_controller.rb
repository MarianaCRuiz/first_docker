class Client::BooksController < ApplicationController
  def show
    @client = current_client
    @book = Book.find(params[:id])
    @final_price = BookClient.find_by(book: @book, client: @client).final_price
  end
end