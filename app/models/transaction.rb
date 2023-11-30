class Transaction < ApplicationRecord
  has_many :categorizations
  has_many :categories, through: :categorizations

  attribute :name, :string
  attribute :amount, :decimal
end
