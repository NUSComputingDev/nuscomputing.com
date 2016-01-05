class CreateMcMembers < ActiveRecord::Migration
  def change
    create_table :mc_members do |t|
      t.string :name
      t.string :position
      t.integer :wingid
      t.integer :wingrank
      t.integer :cellrank
      t.string :course
      t.integer :year
      t.text :description
      t.string :casualimg
      t.string :formalimg

      t.timestamps null: false
    end
  end
end
