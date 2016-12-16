class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :images
      t.text :description
      t.text :options
      t.string :price
      t.string :stock
      t.string :orders

      t.timestamps null: false
    end
  end
end
