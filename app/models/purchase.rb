class Purchase

  # def initialize(book_id: nil, price: 0, discount: 0, client_id: nil)
  #   @book_id = book_id
  #   @price = price
  #   @discount = discount
  #   @client_id = client_id
  # end
  def generate(params)
    @book = Book.find(params[:book_id])
    purchase_data = { book_id: book.id, price: book.price, discount: book.discount, client_id: params[:cliente_id] }
    resp = Faraday.post("#{Rails.configuration.external_apis[:purchase_api]}/api/v1/purchase",
                        params: { **purchase_data })
    # return nil unless resp.status == 200

    JSON.parse(resp.body, symbolize_names: true)
    #rescue Faraday::ConnectionFailed
    #nil
  end
end