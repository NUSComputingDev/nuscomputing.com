class Mc::LockerController < Mc::BaseController

  def home
  	@current_round = LockerRound.active_at(DateTime.now).first
		@last_round = LockerRound.where('end < ?', DateTime.now).order({end: :desc}).first
  end

	def email
		LockerNotifier.test_email(current_user).deliver_later 
		redirect_to mc_locker_path, notice: "Email sent"
	end
end
