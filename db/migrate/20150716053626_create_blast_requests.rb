class CreateBlastRequests < ActiveRecord::Migration
  def change
    create_table :blast_requests do |t|
      t.attachment :image
      t.text :text
      t.integer :status, default: 0
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
