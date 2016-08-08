class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.string :name
      t.string :email
      t.integer :contact
      t.text :message

      t.timestamps null: false
    end
  end
end
