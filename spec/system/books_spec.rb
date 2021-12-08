require 'rails_helper'

describe 'Managing books' do
  it '#index' do
    book1 = create(:book, price: 10.0, discount: 1.2)
    book2 = create(:book, price: 13.0, discount: 1.4)

    visit root_path
    click_on 'Livros'

    expect(current_path).to eq(books_path)
    expect(page).to have_content('Livros')
    expect(page).to have_content(book1.name)
    expect(page).to have_content(book1.author)
    expect(page).to have_content('R$ 10,00')
    expect(page).to have_content('1,20%')
    expect(page).to have_content(book2.name)
    expect(page).to have_content(book2.author)
    expect(page).to have_content('R$ 13,00')
    expect(page).to have_content('1,40%')
  end
end
