class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false, presence: true
      t.text :images
      t.text :description
      t.text :options
      t.string :price, null: false, presence: true
      t.string :stock, null: false, presence: true,
        numericality: { only_integer: true }
      t.string :orders, null: false, presence: true,
        numericality: { only_integer: true }

      t.timestamps null: false
    end
  end
end
