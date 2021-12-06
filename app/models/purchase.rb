class Purchase

  def self.generate(params)
    @book = Book.find(params[:book_id])
    @client = Client.find(params[:client_id])
    purchase_data = { book_id: @book.id, price: @book.price, discount: @book.discount, client_id: @client.id }
    resp = Faraday.post("#{Rails.configuration.external_apis[:purchase_api]}/api/v1/purchase",
                        params: { purchase_order: purchase_data })
    # return nil unless resp.status == 200
    JSON.parse(resp.body, symbolize_names: true)
    #rescue Faraday::ConnectionFailed
    #nil
  end
end