class CreateLockerAllocations < ActiveRecord::Migration
  def change
    create_table :locker_allocations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :locker, index: true, foreign_key: true
      t.references :locker_round, index: true, foreign_key: true
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
