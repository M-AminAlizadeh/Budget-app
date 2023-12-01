class Transaction < ApplicationRecord
  has_many :categorizations, class_name: 'Categorization'
  has_many :categories, through: :categorizations

  attribute :name, :string
  attribute :amount, :decimal

  validates :name, presence: true
  validates :amount, presence: true
end
