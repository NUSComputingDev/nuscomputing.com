class CreateBlastItems < ActiveRecord::Migration
  def change
    create_table :blast_items do |t|
      t.integer :image_ratio
      t.integer :text_ratio
      t.references :blast, index: true, foreign_key: true
      t.references :blast_request, index: true, foreign_key: true
      t.integer :position_index

      t.timestamps null: false
    end
  end
end
