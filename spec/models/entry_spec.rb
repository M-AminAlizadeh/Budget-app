require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe 'validations' do
    it 'validates the presence of name' do
      entry = Entry.new(amount: 10.0)
      expect(entry).not_to be_valid
    end

    it 'validates the presence of amount' do
      entry = Entry.new(name: 'Test Entry')
      expect(entry).not_to be_valid
    end

    it 'is valid with valid attributes' do
      entry = Entry.new(name: 'Test Entry', amount: 10.0)
      expect(entry).to be_valid
    end
  end
end
