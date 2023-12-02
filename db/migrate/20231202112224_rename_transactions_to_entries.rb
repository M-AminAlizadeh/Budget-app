class RenameTransactionsToEntries < ActiveRecord::Migration[7.1]
  def change
    rename_table :transactions, :entries
  end
end
