class CreateItemTransactions < ActiveRecord::Migration
  def change
    create_table :item_transactions do |t|
      t.integer :status,									default: 0
      t.datetime :pending_sent_at
      t.datetime :pending_expire_at
      t.datetime :pending_completed_at
      t.datetime :transaction_began_at
      t.datetime :transaction_end_at
      t.datetime :transaction_completed_at
      t.string :token,										null: false, unique: true, index: true
      t.references :item_request, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
