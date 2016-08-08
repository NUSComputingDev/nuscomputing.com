class ChangeLocationColumnInLocker < ActiveRecord::Migration
  def change
  	change_column :lockers, :location, :integer, default: 0
  end
end
