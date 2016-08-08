class CreateItemRequests < ActiveRecord::Migration
  def change
    create_table :item_requests do |t|
      t.references :user, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.integer :status, default: 0
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
