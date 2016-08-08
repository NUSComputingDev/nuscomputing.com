class RenameItemTypeInItems < ActiveRecord::Migration
  def change
  	remove_reference :items, :type
  	add_reference :items, :item_type, index: true
  end
end
