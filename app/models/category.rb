class Category < ApplicationRecord
  has_many :categories_entries
  has_many :entries, through: :categories_entries
end
