require 'rails_helper'

describe 'visitor access' do
  it 'see home page' do
    visit root_path

    expect(page).to have_content('Hello')
  end
end
