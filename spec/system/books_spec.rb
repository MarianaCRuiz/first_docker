require 'rails_helper'

describe 'Managing books' do
  it '#index' do
    book1 = create(:book)
    book2 = create(:book)

    visit root_path
    click_on 'Livros'

    expect(current_path).to eq(books_path)
    expect(page).to have_content('Livros')
    expect(page).to have_content(book1.name)
    expect(page).to have_content(book1.author)
    expect(page).to have_content(book1.price)
    expect(page).to have_content(book1.discount)
    expect(page).to have_content(book2.name)
    expect(page).to have_content(book2.author)
    expect(page).to have_content(book2.price)
    expect(page).to have_content(book2.discount)
  end
end