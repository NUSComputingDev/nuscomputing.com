class BlastRequest < ActiveRecord::Base
	enum status: [:pending, :bumped, :sent, :rejected]
	has_attached_file :image, :styles => { medium: "500x500#", small: "300x300#", thumb: "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	has_many :blast_items
  has_many :blasts, through: :blast_items
  belongs_to :requester, class_name: "Member", foreign_key: "member_id"

	scope :publishable, -> { where('status = ? or status = ?', 0, 1) }
end
