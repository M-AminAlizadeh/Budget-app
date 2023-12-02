require 'rails_helper'

RSpec.feature 'Entries', type: :feature do
  before :each do
    visit unauthenticated_root_path
  end

  it 'has the log in button' do
    expect(page).to have_text(/log in/i)
  end

  it 'has the sign up button' do
    expect(page).to have_text(/sign up/i)
  end
end
