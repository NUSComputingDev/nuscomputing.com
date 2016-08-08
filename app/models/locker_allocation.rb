class LockerAllocation < ActiveRecord::Base
  belongs_to :user
  belongs_to :locker
  belongs_to :round, class_name: "LockerRound", foreign_key: "locker_round_id"

  enum status: [:active, :archived]
  validates :user, :locker, :round, presence: true
  validates_uniqueness_of :user, conditions: -> { where.not(status: 1) }

  def self.to_csv
    headers = %w{ name user_id email locker_location locker_number acad_year allocation_status }
    CSV.generate(headers: true) do |csv|
      csv << headers
      all.each do |allocation|
        csv << [
            allocation.user.name,
            allocation.user.uid,
            allocation.user.email,
            allocation.locker.location,
            allocation.locker.number,
            allocation.round.acad_year,
            allocation.status
            ]
      end
    end
  end

end
