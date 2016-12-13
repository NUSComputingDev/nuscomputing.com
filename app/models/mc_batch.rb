class McBatch < ActiveRecord::Base
  has_many :mc_members, dependent: :destroy
end
