class ItemTransaction < ActiveRecord::Base
  enum status: [:pending, :in_process, :expired, :overdued, :completed, :cancelled]
  belongs_to :request, class_name: "ItemRequest", foreign_key: "item_request_id", inverse_of: :item_transaction
  has_one :item, through: :request

  has_secure_token
  has_attached_file :qrcode, :styles => { :medium => "300x300#"}
  validates_attachment_content_type :qrcode, :content_type => /\Aimage\/.*\Z/

  after_create :generate_qrcode

	def full_url
		Rails.application.routes.url_helpers.mc_borrow_item_transactions_url + "/#{self.token}"
	end

  def generate_qrcode
		tempFile = Tempfile.new(["qrcode", ".png"], "#{Rails.root.to_s}/tmp/")
		begin
			RQRCode::QRCode.new( full_url, :size => 8, :level => :h ).as_png.save(tempFile.path)
			self.update qrcode: File.open(tempFile.path)
		ensure
			tempFile.close!
		end
  end
end
