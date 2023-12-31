class Category < ApplicationRecord
  belongs_to :user
  has_many :categories_entries
  has_many :entries, through: :categories_entries

  validates :name, presence: true
end
