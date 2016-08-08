class Portal::LockerController < Portal::BaseController
	def home
		current_time = DateTime.now
		@round = LockerRound.active_at(current_time).first
		if @round && current_user
			@ballot = LockerBallot.where('user_id = ? and locker_round_id = ?', current_user.id, @round.id).first_or_initialize
		end
	end
end
