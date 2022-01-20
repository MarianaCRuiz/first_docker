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
  it '#destroy_all' do
    client1 = create(:client)
    client2 = create(:client)
    book1 = create(:book)
    book2 = create(:book)
    book3 = create(:book)
    create(:book_client, client: client1, book: book1)
    create(:book_client, client: client1, book: book2)
    create(:book_client, client: client2, book: book1)
    create(:book_client, client: client2, book: book3)
    login_as client1, scope: :client
    visit root_path
    click_on 'Meus Livros'
    click_on 'Apagar Lista'

    expect(current_path).to eq(clients_books_path)
    expect(page).to have_content('Lista excluida com sucesso')
    expect(page).to_not have_content(book1.name)
    expect(page).to_not have_content(book1.author)
    expect(page).to_not have_content(book2.name)
    expect(page).to_not have_content(book2.author)
    expect(BookClient.where(client: client1).count).to eq(0)
    expect(BookClient.where(client: client2).count).to eq(2)
    expect(Book.count).to eq(3)
    expect(Client.count).to eq(2)
  end
end
