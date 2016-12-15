class AddDefaultValueToSponsorsFeatured < ActiveRecord::Migration
  def up
    change_column_default :sponsors, :featured, true
  end

  def down
    change_column_default :sponsors, :featured, nil
  end
end
