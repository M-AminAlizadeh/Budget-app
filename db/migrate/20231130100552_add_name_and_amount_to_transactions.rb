class AddNameAndAmountToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :name, :string
    add_column :transactions, :amount, :decimal
  end
end
