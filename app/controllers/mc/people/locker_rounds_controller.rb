class Mc::Locker::LockerRoundsController < Mc::BaseController
  before_action :set_round, only: [:show, :edit, :update, :destroy, :allocate]

  def show
	end

  def index
  	@rounds = LockerRound.all
  end

  def new
  	@round = LockerRound.new
  end

  def create
  	@round = LockerRound.new(round_params)

  	respond_to do |format|
			if @round.save
				AllocateLockerJob.set(wait_until: @round.end).perform_later(@round.id)
  			format.html { redirect_to mc_locker_locker_rounds_path, notice: "New locker round added" }
  			format.json { render json: @round, status: :created, location: @round }
  			format.js {}
			else
				format.html { render 'new' }
				format.json { render json: @round.errors, status: :unprocessable_entity }
			end
		end
	end

  def edit
  end

  def update
  	respond_to do |format|
			if @round.update round_params
  			format.html { redirect_to mc_locker_locker_round_path, notice: "Locker round editted" }
  			format.json { render json: @round, status: :created, location: @round }
  			format.js {}
			else
				format.html { render 'edit' }
				format.json { render json: @round.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		respond_to do |format|
			if @round.destroy
				format.html { redirect_to mc_locker_locker_rounds_path, notice: "Round successfully destroyed" }
				format.js {}
			else
				format.html { redirect_to :back, notice: "Cannot destroy" }
			end
		end
	end

	def allocate
		unless @round.allocated
      @round.update allocated: true
			AllocateLockerJob.perform_later params[:round]
			redirect_to mc_locker_locker_round_path, notice: "Allocation for this round has started."
		end
	end

  private
  def set_round
		@round = LockerRound.find(params[:id])
	end
  def round_params
		params.require(:locker_round).permit(:start, :end, :acad_year, :label, :kind, :allocated)
	end
end
