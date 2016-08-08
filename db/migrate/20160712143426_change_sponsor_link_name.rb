class ChangeSponsorLinkName < ActiveRecord::Migration
  def change
      rename_column :sponsors, :link, :website
  end
end
