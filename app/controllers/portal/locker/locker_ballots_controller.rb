class Portal::Locker::LockerBallotsController < Portal::BaseController
	before_action :authenticate_user!
	before_action :set_ballot, only: [:update, :destroy]

  def index
    current_time = DateTime.now
    @round = LockerRound.active_at(current_time).first
    if @round && current_user
      @ballot = LockerBallot.where('user_id = ? and locker_round_id = ?', current_user.id, @round.id).first_or_initialize
    end
  end

	def create
		@ballot = LockerBallot.new ballot_params	
		@ballot.user_id = current_user.id

		respond_to do |format|
			if DateTime.now <= @ballot.round.end && @ballot.save
        mail_notify(current_user, @ballot)
				format.html {
          redirect_to portal_locker_locker_ballots_path,
                      notice: 'Ballot application submitted! Please check your NUS email for confirmation. Do contact us at connect@nuscomputing.com if there are any issues.'
				}
				format.json { render json: @ballot, status: :created, location: @ballot }
			else
				format.html { redirect_to portal_locker_locker_ballots_path }
				format.json { render json: @ballot.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		if @ballot.update(ballot_params)
      mail_notify(current_user, @ballot)
			redirect_to portal_locker_locker_ballots_path,
                  notice: 'Ballot updated! Please check your NUS email for confirmation. Do contact us at connect@nuscomputing.com if there are any issues.'
		end
	end

	def destroy
		@ballot.destroy
		redirect_to portal_locker_locker_ballots_path, notice: 'Your Ballot has been cancelled'
	end

	private 
	def ballot_params
		params.require(:locker_ballot).permit(:location, :locker_round_id)
	end

	def set_ballot
		@ballot = LockerBallot.find(params[:id])
  end

  def mail_notify(user, ballot)
    BallotNotifier.submitted_ballot_to_user(user, ballot).deliver_later
    BallotNotifier.submitted_ballot_to_bot(user, ballot).deliver_later
  end
end
