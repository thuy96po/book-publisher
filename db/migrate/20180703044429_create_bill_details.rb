class CreateBillDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :bill_details do |t|
      t.references :bill, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :quantity
      t.integer :price

      t.timestamps
    end

    add_index :bill_details, [:created_at, :bill_id]
  end
end
