class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :image
      t.integer :price
      t.text :description
      t.integer :quantity
      t.float :average_rate
      t.references :author, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end

    add_index :books, [:author_id, :category_id, :price]
  end
end
