class CategoriesEntry < ApplicationRecord
  belongs_to :category
  belongs_to :entry
end
