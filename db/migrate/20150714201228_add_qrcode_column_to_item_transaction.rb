class AddQrcodeColumnToItemTransaction < ActiveRecord::Migration
  def up
    add_attachment :item_transactions, :qrcode
  end

  def down
    remove_attachment :item_transactions, :qrcode
  end
end
