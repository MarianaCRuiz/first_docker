require 'rails_helper'

describe 'client books' do
  it '#index' do
    client = create(:client)
    book1 = create(:book)
    book2 = create(:book)
    book3 = create(:book)
    create(:book_client, client: client, book: book1)
    create(:book_client, client: client, book: book2)
    login_as client, scope: :client
    visit root_path
    click_on 'Meus Livros'

    expect(current_path).to eq(clients_books_path)
    expect(page).to have_content(book1.name)
    expect(page).to have_content(book1.author)
    expect(page).to have_content(book2.name)
    expect(page).to have_content(book2.author)
    expect(page).to_not have_content(book3.name)
    expect(page).to_not have_content(book3.author)
  end
end
