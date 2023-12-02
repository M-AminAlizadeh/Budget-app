require 'rails_helper'

RSpec.describe 'Groups Index Page', type: :feature do
  before do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    Group.create(name: 'Category 1', icon: 'icon1.png', user:)
    Group.create(name: 'Category 2', icon: 'icon2.png', user:)

    visit new_user_session_path
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  it 'displays categories with their details' do
    visit groups_path

    expect(page).to have_content('Categories')

    within '.grid' do
      expect(page).to have_content('Category 1')
      expect(page).to have_content('Category 2')

      expect(page).to have_content('Icon: icon1.png', count: 1)
      expect(page).to have_content('Icon: icon2.png', count: 1)

      expect(page).to have_content('Total Amount:', count: 2)

      expect(page).to have_link('View Transactions', count: 2)
    end
  end

  it 'allows adding a new category' do
    visit groups_path

    click_link 'Add a new category'

    expect(page).to have_content('New Category')
  end
end
