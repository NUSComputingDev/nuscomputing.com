class BlastEmail < ActiveRecord::Base
  belongs_to :composer, class_name: "Member", foreign_key: "member_id"
  has_many :blast_items
  has_many :blast_requests, through: :blast_items
  has_attached_file :background_image, :styles => { :medium => "500x500#", :thumb => "100x100#" }
  validates_attachment_content_type :background_image, :content_type => /\Aimage\/.*\Z/

	def draft?
		self.sent_at.nil?
	end
end
