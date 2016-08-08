class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :img
      t.string :link
      t.text :description
      t.boolean :featured

      t.timestamps null: false
    end
  end
end
