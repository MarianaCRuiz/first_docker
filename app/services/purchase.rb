class Purchase
  def self.generate(params)
    setting_purchase_requisition(params)
    resp = Faraday.post("#{Rails.configuration.external_apis[:purchase_api]}/api/v1/charge",
                        charge_order: @purchase_data)
    return nil unless resp.status == 201 || resp.status == 200

    JSON.parse(resp.body, symbolize_names: true)
  rescue Faraday::ConnectionFailed
    nil
  end

  def self.setting_purchase_requisition(params)
    @book = Book.find(params[:book_id])
    @purchase_data = { book_id: @book.id, price: @book.price,
                       discount: @book.discount, client_id: params[:client_id].to_i }
  end
end
