class PurchasesController < ApplicationController
  def index
    byebug
    @purchase = Purchase.generate(params)
  end
end