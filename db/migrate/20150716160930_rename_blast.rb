class RenameBlast < ActiveRecord::Migration
  def change
  	rename_table :blasts, :blast_emails
  	rename_column :blast_items, :blast_id, :blast_email_id
  end
end
