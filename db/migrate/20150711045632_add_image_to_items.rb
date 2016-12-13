class AddImageToItems < ActiveRecord::Migration
  def up
    add_attachment :items, :image
  end

  def down
    remove_attachment :items, :image
  end
end
