class Categorization < ApplicationRecord
  belongs_to :category
  belongs_to :related_transaction, class_name: 'Transaction', foreign_key: 'related_transaction_id'
end
