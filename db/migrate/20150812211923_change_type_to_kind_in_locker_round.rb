class ChangeTypeToKindInLockerRound < ActiveRecord::Migration
  def change
  	rename_column :locker_rounds, :type, :kind
  end
end
