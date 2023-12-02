require 'rails_helper'

feature 'Categories', type: :feature do
  scenario 'User can create a new category' do
    login_as_user

    visit new_category_path

    fill_in 'Name', with: 'Food'
    fill_in 'Icon URL', with: 'https://img.icons8.com/food/48/000000.png'

    click_button 'Save'

    expect(current_path).to eq(authenticated_root_path)
    expect(page).to have_content('Category created successfully.')

    within '.categories-list' do
      expect(page).to have_content('Food')
      expect(page).to have_css("img[src='https://img.icons8.com/food/48/000000.png']")
    end
  end

  scenario 'User can edit a category' do
    login_as_user

    category = create(:category)

    visit edit_category_path(category)

    fill_in 'Name', with: 'Updated Category Name'
    fill_in 'Icon URL', with: 'https://img.icons8.com/updated-category-icon/48/000000.png'

    click_button 'Save'

    expect(current_path).to eq(authenticated_root_path)
    expect(page).to have_content('Category updated successfully.')

    within '.categories-list' do
      expect(page).to have_content('Updated Category Name')
      expect(page).to have_css("img[src='https://img.icons8.com/updated-category-icon/48/000000.png']")
    end
  end
end
