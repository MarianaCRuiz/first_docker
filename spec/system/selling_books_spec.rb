require 'rails_helper'

describe 'client buying book' do
  it 'buying a book' do
    client = create(:client)
    book = create(:book, price: 100, discount: 10)
    purchase_data = { book_id: book.id, price: book.price, discount: book.discount, client_id: client.id }
    purchase_success = File.read(Rails.root.join('spec/fixtures/purchase.json'))

    allow(Faraday).to receive(:post)
      .with("#{Rails.configuration.external_apis[:purchase_api]}/api/v1/charge", charge_order: purchase_data)
      .and_return(instance_double(Faraday::Response, status: 201, body: purchase_success))

    login_as client, scope: :client
    visit books_path
    click_on book.name
    click_on 'Comprar'

    expect(page).to have_content('Compra efetuada com sucesso')
    expect(page).to have_content(90)
  end
  it 'purchase api connection failed' do
    client = create(:client)
    book = create(:book, price: 100, discount: 10)
    purchase_data = { book_id: book.id, price: book.price, discount: book.discount, client_id: client.id }
    allow(Faraday).to receive(:get)
      .with("#{Rails.configuration.external_apis[:purchase_api]}/api/v1/charge", charge_order: purchase_data)
      .and_raise(Faraday::ConnectionFailed, nil)

    login_as client, scope: :client
    visit books_path
    click_on book.name
    click_on 'Comprar'

    expect(current_path).to eq(books_path)
    expect(page).to have_content('Sistema indisponível')
  end
  it 'purchase status 500' do
    client = create(:client)
    book = create(:book, price: 100, discount: 10)
    purchase_data = { book_id: book.id, price: book.price, discount: book.discount, client_id: client.id }
    allow(Faraday).to receive(:get)
      .with("#{Rails.configuration.external_apis[:purchase_api]}/api/v1/charge", charge_order: purchase_data)
      .and_return(instance_double(Faraday::Response, status: 500, body: ''))

    login_as client, scope: :client
    visit books_path
    click_on book.name
    click_on 'Comprar'

    expect(current_path).to eq(books_path)
    expect(page).to have_content('Sistema indisponível')
  end
end
