class Entry < ApplicationRecord
  has_many :categories_entries
  has_many :categories, through: :categories_entries

  validates :name, presence: true
  validates :amount, presence: true
end
