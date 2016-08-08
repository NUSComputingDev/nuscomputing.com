class ItemRequest < ActiveRecord::Base
  enum status: [:pending, :approved, :rejected, :completed]
  belongs_to :user
  belongs_to :item
  belongs_to :processor, class_name: "Member", foreign_key: "member_id"
  has_one :item_transaction, inverse_of: :request
end
