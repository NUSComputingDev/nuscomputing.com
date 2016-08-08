class CreateLockers < ActiveRecord::Migration
  def change
    create_table :lockers do |t|
      t.string :location
      t.string :number
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
