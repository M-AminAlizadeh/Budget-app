require 'rails_helper'

RSpec.feature 'Dashboard', type: :feature do
  scenario 'User can see a list of categories on the dashboard' do
    user = create(:user)
    login_as(user, scope: :user)

    categories = create_list(:category, 3, user:)

    visit authenticated_root_path

    expect(page).to have_content('Dashboard')

    within '.categories-list' do
      categories.each do |category|
        expect(page).to have_content(category.name)
        # Add more expectations based on your category display logic
      end
    end
  end
end
