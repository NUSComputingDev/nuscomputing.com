class ItemType < ActiveRecord::Base
	has_many :items, inverse_of: :type, dependent: :destroy
	has_attached_file :image, :styles => { :medium => "300x300#", :thumb => "100x100#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
