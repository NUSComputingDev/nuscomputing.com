class RemovePendingCompletedAtColumnInItemTransaction < ActiveRecord::Migration
  def change
  	remove_column :item_transactions, :pending_completed_at
  end
end
