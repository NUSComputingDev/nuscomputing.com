class ChangeDataTypeForSponsors < ActiveRecord::Migration
  def change
      change_column :sponsors, :description, :text
  end
end
