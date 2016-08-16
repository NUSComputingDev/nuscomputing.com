class LockerBallot < ActiveRecord::Base
  belongs_to :user
  belongs_to :round, class_name: "LockerRound", foreign_key: "locker_round_id"

  scope :in_round, ->(round) { where('locker_round_id = ?', round.id) if round.id }
	scope :by_location, ->(loc) { where('location = ?', loc.to_s) if loc }

  validates :location, :user, :round, presence: true
  validates_uniqueness_of :user_id, scope: :round

  def self.ballots_by_round
		LockerBallot.all.group_by { |ballot| LockerRound.find(ballot.round) }.sort_by { |round, ballots| [round.acad_year, round.label] }
	end

	def self.stat_by_location(round, loc)
		"#{loc} (#{LockerBallot.in_round(round).by_location(loc).count} / #{Locker.vacant.where(location: Locker.locations[loc]).count})"
  end

  def self.to_csv
    headers = %w{ name user_id email faculty first_major second_major ballot_round ballot_location }
    CSV.generate(headers: true) do |csv|
      csv << headers
      all.each do |ballot|
        csv << [
            ballot.user.name,
            ballot.user.uid,
            ballot.user.email,
            ballot.user.faculty,
            ballot.user.first_major,
            ballot.user.second_major,
            ballot.round.name,
            ballot.location
        ]
      end
    end
  end

end
