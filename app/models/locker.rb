class Locker < ActiveRecord::Base
	# This is for form input when creating multiple lockers
	attr_accessor :start_number
	attr_accessor :end_number

	enum status: [:vacant, :occupied, :faulty, :closed]
	enum location: [:A, :B, :C, :D, :E, :F, :G, :H]
	scope :allocatable, -> { where('status = ?', 0) }	

	has_many :allocations, class_name: 'LockerAllocation'
	has_many :users, through: :allocations

	validates :number, format: { with: /\A\d{1,8}\Z/, message: 'numbers from 0 to 99999999 only'}
	validates_uniqueness_of :number, scope: [:location, :number]

	def self.lockers_by_location
		Locker.all.order('number ASC').group_by(&:location)
	end

	def name
		"#{location} - #{number}"
	end

	def current_allocation
		allocations.active.first
	end

	def current_user
		current_allocation.user
	end
end
