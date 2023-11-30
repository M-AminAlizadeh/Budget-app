class Category < ApplicationRecord
  has_many :categorizations
  has_many :transactions, through: :categorizations
end
