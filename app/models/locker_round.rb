class LockerRound < ActiveRecord::Base
	has_many :ballots, class_name: "LockerBallot"
	has_many :allocations, class_name: "LockerAllocation"

	enum kind: [:ballot]
	scope :active_at, -> (time) { where('start <= ? and end > ?', time, time) }

  validates 'start', 'end', 'acad_year', 'label', 'kind', presence: true
	validate 'unique_name'

	def unique_name
		if LockerRound.where(acad_year: self.acad_year, label: self.label).where.not(id: self.id).any?
			errors.add(:label, "#{self.name} already exists!")
			return false
		else
			return true
		end
	end

	def name
		"#{acad_year} (#{label})"
	end
end
