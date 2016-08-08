class AddExternalpageToEvents < ActiveRecord::Migration
  def change
    add_column :events, :externalpage, :string
  end
end
