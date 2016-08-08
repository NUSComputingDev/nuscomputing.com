class AddMcMemberToMcWing < ActiveRecord::Migration
  def change
    add_reference :mc_wings, :mc_member, index: true, foreign_key: true
  end
end
