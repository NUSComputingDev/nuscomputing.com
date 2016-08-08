class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_major, :string
    add_column :users, :second_major, :string
    add_column :users, :gender, :string
    add_column :users, :matriculation_year, :string
  end
end
