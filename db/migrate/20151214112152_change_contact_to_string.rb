class ChangeContactToString < ActiveRecord::Migration
  def change
  	change_column :enquiries, :contact, :string
  end
end
