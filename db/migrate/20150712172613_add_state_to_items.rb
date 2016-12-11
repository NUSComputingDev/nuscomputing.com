class AddStateToItems < ActiveRecord::Migration
  def change
    add_column :items, :state, :integer, default: 0
  end
end
