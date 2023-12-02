require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with valid attributes' do
    category = Category.new(name: 'Food', icon_url: 'https://img.icons8.com/material/24/kawaii-pizza.png')

    expect(category.name).to eq('Food')
  end
end
