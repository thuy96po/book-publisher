class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :avatar
      t.integer :role
      t.string :password_digest
      t.string :remember_digest
      t.string :activation_digest
      t.datetime :activated_at
      t.string :activated
      t.string :boolean
      t.string :reset_digest
      t.datetime :reset_send_at

      t.timestamps
    end

    add_index :users, :email
  end
end
