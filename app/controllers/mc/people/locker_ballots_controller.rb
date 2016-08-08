class Mc::Locker::LockerBallotsController < Mc::BaseController
	before_action :set_ballot, only: [:show, :edit, :update, :destroy]

	def index
		@ballots = nil
		if params[:locker_ballot] && params[:locker_ballot][:round]
			@ballots = LockerBallot.joins(:user).where('locker_round_id = ?', params[:locker_ballot][:round]).order("uid").page params[:page]
		end

		respond_to do |format|
			format.html {}
			if @ballots
				format.js {}
			end
		end
	end

	def new
		@ballot = LockerBallot.new
	end

	def show
	end

	def create
		@ballot = LockerBallot.new ballot_params

		respond_to do |format|
			if @ballot.save
				format.html { redirect_to mc_locker_locker_ballots_path, notice: "New Ballot added" }
				format.json { render json: @ballot, status: :created, location: @ballot }
				format.js {}
			else
				format.html { render 'new' }
				format.json { render json: @ballot.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		if @ballot.update(ballot_params)
			redirect_to mc_locker_locker_ballot_path(@ballot)
		else
			render 'edit'
		end
	end

	def destroy
		respond_to do |format|
			if @ballot.destroy
				format.html { redirect_to mc_locker_locker_ballots_path, notice: "Ballot successfully destroyed" }
				format.js {}
			else
				format.html { redirect_to :back, notice: "Cannot destroy" }
			end
		end
	end

	private

	def set_ballot
		@ballot = LockerBallot.find(params[:id])
	end

	def ballot_params
		params.require(:locker_ballot).permit(:user_id, :location, :locker_round_id)
	end
end
