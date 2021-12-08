class BooksController < ApplicationController
  before_action :set_client
  def index
    @books = Book.all
  end

  def show
    @client = current_client
    @book = Book.find(params[:id])
  end

  private

  def set_client
    @client = current_client if client_signed_in?
  end
end
