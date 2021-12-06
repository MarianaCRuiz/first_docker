class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  def show
    @client = current_client
    @book = Book.find(params[:id])
  end
end