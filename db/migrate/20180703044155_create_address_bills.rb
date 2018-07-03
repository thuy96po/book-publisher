class CreateAddressBills < ActiveRecord::Migration[5.1]
  def change
    create_table :address_bills do |t|
      t.string :address
      t.string :phone
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
