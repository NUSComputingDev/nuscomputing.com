class CreateLockerRounds < ActiveRecord::Migration
  def change
    create_table :locker_rounds do |t|
      t.datetime :start
      t.datetime :end
      t.string :acad_year
      t.string :label
      t.integer :type

      t.timestamps null: false
    end
  end
end
