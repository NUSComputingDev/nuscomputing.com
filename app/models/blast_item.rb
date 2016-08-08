class BlastItem < ActiveRecord::Base
  belongs_to :blast_email
  belongs_to :blast_request
end
