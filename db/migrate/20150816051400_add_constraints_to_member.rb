class AddConstraintsToMember < ActiveRecord::Migration
  def change
  	change_column_default :members, :provider, ""
  	change_column_default :members, :uid, ""
  	change_column_null :members, :provider, false
  	change_column_null :members, :uid, false
  end
end
