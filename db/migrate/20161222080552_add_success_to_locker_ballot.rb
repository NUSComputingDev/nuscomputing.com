class AddSuccessToLockerBallot < ActiveRecord::Migration
  def change
    add_column :locker_ballots, :success, :boolean
  end
end
