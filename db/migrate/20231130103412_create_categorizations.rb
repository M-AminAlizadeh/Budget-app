class CreateCategorizations < ActiveRecord::Migration[7.1]
  def change
    create_table :categorizations do |t|
      t.references :category, null: false, foreign_key: true
      t.references :related_transaction, null: false, foreign_key: { to_table: :transactions }

      t.timestamps
    end
  end
end
