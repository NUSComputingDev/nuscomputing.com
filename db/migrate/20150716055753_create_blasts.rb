class CreateBlasts < ActiveRecord::Migration
  def change
    create_table :blasts do |t|
      t.datetime :sent_at
      t.attachment :background_image
      t.string :background_color
      t.integer :width
      t.integer :height
      t.text :items_position
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
