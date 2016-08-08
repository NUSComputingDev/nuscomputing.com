class CreateMcWings < ActiveRecord::Migration
  def change
    create_table :mc_wings do |t|
      t.integer :wingid
      t.string :wingname

      t.timestamps null: false
    end
  end
end
