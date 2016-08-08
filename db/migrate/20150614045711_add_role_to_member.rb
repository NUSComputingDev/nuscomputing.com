class AddRoleToMember < ActiveRecord::Migration
  def change
    add_reference :members, :role, index: true, foreign_key: true
  end
end
