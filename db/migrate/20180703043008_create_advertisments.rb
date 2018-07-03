class CreateAdvertisments < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisments do |t|
      t.string :image
      t.string :url
      t.boolean :status

      t.timestamps
    end
  end
end
