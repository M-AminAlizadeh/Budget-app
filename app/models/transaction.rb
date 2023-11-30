class Transaction < ApplicationRecord
  has_many :categorizations
  has_many :categories, through: :categorizations
  def change
    create_table :transactions do |t|
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
