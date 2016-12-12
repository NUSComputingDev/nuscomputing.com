class CreateMcBatches < ActiveRecord::Migration
  def change
    create_table :mc_batches do |t|
      t.string :name, null: false
      t.boolean :published

      t.timestamps null: false
    end

    # link mc_members to mc_batch
    add_column :mc_members, :mc_batch_id, :integer
    add_foreign_key :mc_members, :mc_batches

    # add mc_batch
    McBatch.create(name: "18th Management Committee", published: true)

    #set current members to be of first batch
    McMember.reset_column_information
    McMember.update_all(mc_batch_id: 1)

  end
end
