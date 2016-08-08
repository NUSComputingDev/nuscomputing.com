class ChangeStatusColumnInItems < ActiveRecord::Migration
  def up
  	change_column :items, :status, :integer, default: 0
  end

  def down
  	change_column :items, :status, :string
	end
end
