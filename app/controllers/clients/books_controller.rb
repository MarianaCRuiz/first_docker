class Clients::BooksController < ApplicationController
  before_action :authenticate_client!

  def index
    @client = current_client
    @books = @client.books
    @books_client = BookClient.where(client: @client)
  end

  def destroy_all
    @client = current_client
    @client.books.destroy_all
    redirect_to clients_books_path, notice: 'Lista excluida com sucesso'
  end
end
