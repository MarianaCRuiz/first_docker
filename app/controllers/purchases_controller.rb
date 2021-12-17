class PurchasesController < ApplicationController
  def create
    setting_purchase(params)
    if @purchase
      BookClient.create!(book: @book, client: @client, final_price: @purchase[:final_price])
      redirect_to clients_books_path, notice: 'Compra efetuada com sucesso'
    else
      redirect_to books_path, alert: 'Sistema indisponível'
    end
  end

  private

  def setting_purchase(params)
    @client = current_client
    @book = Book.find(params[:book_id])
    @purchase = Purchase.generate(params)
  end
end
