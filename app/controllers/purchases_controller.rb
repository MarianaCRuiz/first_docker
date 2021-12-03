class PurchasesController < ApplicationController
  def index
    @book = Book.find(params[:book_id])
    @purchase = Purchase.generate(params)
    redirect_to book_path(@book), notice: 'Compra efetuada com sucesso'
  end
end