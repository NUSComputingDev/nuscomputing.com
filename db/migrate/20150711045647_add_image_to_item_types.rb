class AddImageToItemTypes < ActiveRecord::Migration
 def up
    add_attachment :item_types, :image
  end

  def down
    remove_attachment :item_types, :image
	end
end
