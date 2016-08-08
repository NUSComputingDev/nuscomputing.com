class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :label
      t.references :type, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
