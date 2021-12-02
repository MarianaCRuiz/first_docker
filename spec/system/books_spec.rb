require 'rails_helper'

describe 'Managing books' do
  xit '#index' do

    click_on 'Livros'

    expect(page).to have_content('Livro 1')
  end
end