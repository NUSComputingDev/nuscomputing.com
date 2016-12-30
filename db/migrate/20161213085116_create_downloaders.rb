class CreateDownloaders < ActiveRecord::Migration
  def change
    create_table :downloaders do |t|
      t.string :name, null: false,
        presence: true,
        format: { with: /(?<name>[A-Z][a-zA-Z]{2,})/},
        length: { maximum: 32 }
      t.string :phone,
        null: false,
        presence: true,
        numericality: { only_integer: true },
        length: { minimum: 8, maximum: 16 }
      t.string :email,
        null: false,
        presence: true,
        format: { with: /(?<user>\w{2,})\@(?<domain>\w{2,})\.(?<extension>\w{2,})/ },
        length: { maximum: 64 }
      t.string :organisation,
        null: false,
        presence: true,
        length: { minimum: 2 }

      t.timestamps null: false
    end
  end
end
