class Downloader < ActiveRecord::Base
  validates :name,
    null: false,
    presence: true,
    format: { with: /(?<name>[A-Z][a-zA-Z]{2,})/},
    length: { maximum: 32 }
  validates :phone,
    null: false,
    presence: true,
    numericality: { only_integer: true },
    length: { minimum: 8, maximum: 16 }
  validates :email,
    null: false,
    presence: true,
    format: { with: /(?<user>\w{2,})\@(?<domain>\w{2,})\.(?<extension>\w{2,})/ },
    length: { maximum: 64 }
  validates :organisation,
    null: false,
    presence: true,
    length: { minimum: 2 }
end
