class CreateCategoriesEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :categories_entries do |t|
      t.references :category, null: false, foreign_key: true
      t.references :entry, null: false, foreign_key: true

      t.timestamps
    end
    add_index :categories_entries, [:category_id, :entry_id], unique: true
  end
end
