module Portal::LockerHelper
	def locker_allocated?(user)
		!!LockerAllocation.active.find_by(user_id: user.id)
	end
end
