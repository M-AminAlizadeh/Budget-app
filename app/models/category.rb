class Category < ApplicationRecord
  has_many :categorizations
  has_many :transactions, through: :categorizations, source: :related_transaction
end
