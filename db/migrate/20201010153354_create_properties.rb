class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :price
      t.string :address
      t.integer :years
      t.text :etc
      t.timestamps
    end
  end
end
