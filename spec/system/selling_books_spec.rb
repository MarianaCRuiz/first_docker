require 'rails_helper'

describe 'client buying book' do
  xit 'buying a book' do
    client = create(:client)
    book = create(:book)

    visit books_path
    click_on book.name
    click_on 'Comprar'

    expect(page).to have_content('Compra efetuada com sucesso')
  end
end