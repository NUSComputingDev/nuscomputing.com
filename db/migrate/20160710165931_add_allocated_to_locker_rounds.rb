class AddAllocatedToLockerRounds < ActiveRecord::Migration
  def change
    add_column :locker_rounds, :allocated, :boolean, default: 0
  end
end
