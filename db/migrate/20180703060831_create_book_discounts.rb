class CreateBookDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :book_discounts do |t|
      t.references :book, foreign_key: true
      t.float :discount
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end

    add_index :book_discounts, [:book_id, :start_date, :end_date]
  end
end
