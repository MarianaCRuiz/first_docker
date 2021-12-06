require 'rails_helper'

describe 'client buying book' do
  it 'buying a book' do
    client = create(:client)
    book = create(:book, price: 100, discount: 10)
    purchase_data = { book_id: book.id, price: book.price, discount: book.discount, client_id: client.id }
    purchase_accepted = File.read(Rails.root.join('spec/fixtures/purchase.json'))

    allow(Faraday).to receive(:post)
      .with("#{Rails.configuration.external_apis[:purchase_api]}/api/v1/purchase",
            params: { purchase_order: purchase_data })
      .and_return(instance_double(Faraday::Response, status: 200, body: purchase_accepted))

    login_as client, scope: :client
    visit books_path
    click_on book.name
    click_on 'Comprar'

    expect(page).to have_content('Compra efetuada com sucesso')
  end
end