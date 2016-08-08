class AddFacultyToUser < ActiveRecord::Migration
  def change
  	add_column :users, :faculty, :string
  end
end
