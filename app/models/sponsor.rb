class Sponsor < ActiveRecord::Base

  validates :name, :img, :website, :description, presence: true

end
