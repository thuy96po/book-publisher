class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.references :address_bill, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
