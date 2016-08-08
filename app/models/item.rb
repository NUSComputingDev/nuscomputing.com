class Item < ActiveRecord::Base
  belongs_to :type, class_name: "ItemType", foreign_key: "item_type_id", inverse_of: :items 
  has_many :requests, class_name: "ItemRequest", dependent: :destroy
  has_many :item_transactions, through: :requests, dependent: :destroy
  enum status: [:available, :requested, :borrowed]
  enum state: [:ok, :missing, :faulty, :discarded]

  has_attached_file :image, :styles => { :medium => "300x300#", :thumb => "100x100#" }, default_url: "/image/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def borrowable?
  	self.available? and self.ok?
	end
end
