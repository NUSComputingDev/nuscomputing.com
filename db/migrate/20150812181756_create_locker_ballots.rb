class CreateLockerBallots < ActiveRecord::Migration
  def change
    create_table :locker_ballots do |t|
      t.references :user, index: true, foreign_key: true
      t.references :locker_round, index: true, foreign_key: true
      t.string :location

      t.timestamps null: false
    end
  end
end
