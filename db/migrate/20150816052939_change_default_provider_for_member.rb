class ChangeDefaultProviderForMember < ActiveRecord::Migration
  def change
  	change_column_default :members, :provider, "google_oauth2"
  end
end
