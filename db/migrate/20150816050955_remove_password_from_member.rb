class RemovePasswordFromMember < ActiveRecord::Migration
  def change
  	remove_column :members, :encrypted_password
  	remove_column :members, :reset_password_token
  	remove_column :members, :reset_password_sent_at
  end
end
