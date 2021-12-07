class PurchasesController < ApplicationController
  def create
    @client = current_client
    @book = Book.find(params[:book_id])
    @purchase = Purchase.generate(params)
    BookClient.create!(book: @book, client: @client, final_price: @purchase[:final_price])
    redirect_to clients_books_path, notice: 'Compra efetuada com sucesso'
  end
end
