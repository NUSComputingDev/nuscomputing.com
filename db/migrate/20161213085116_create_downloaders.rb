class CreateDownloaders < ActiveRecord::Migration
  def change
    create_table :downloaders do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :organisation

      t.timestamps null: false
    end
  end
end
