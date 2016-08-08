class Mc::Locker::LockerAllocationsController < Mc::BaseController
	before_action :set_allocation, only: [:show, :edit, :update, :destroy]

	def index
		@allocations = nil
		if params[:locker_allocation] && params[:locker_allocation][:year]
			@allocations = LockerAllocation.joins(:round, :user).where('acad_year = ?', params[:locker_allocation][:year]).order("uid").page params[:page]
			@acad_year = params['locker_allocation']['year']
		end

		respond_to do |format|
			format.html {}
			if @allocations
				format.js {}
			end
      format.csv {
        @allocations = LockerAllocation.all
        send_data @allocations.to_csv, filename: 'allocations.csv', type: 'text/csv'
      }
		end
  end

	def new
		@allocation = LockerAllocation.new
	end

	def show
	end

	def create
		@allocation = LockerAllocation.new allocation_params

		respond_to do |format|
			if @allocation.save
				# Update status of the locker
				@allocation.locker.update status: :occupied
				format.html { redirect_to mc_locker_locker_allocations_path, notice: 'New allocation added' }
				format.json { render json: @allocation, status: :created, location: @allocation }
				format.js {}
			else
				format.html { render 'new' }
				format.json { render json: @allocation.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		old_locker = @allocation.locker
		previous_allocation_of_new_locker = LockerAllocation.active.find_by locker_id: params[:locker_allocation][:locker_id]
		if @allocation.update(allocation_params)
			if previous_allocation_of_new_locker
				previous_allocation_of_new_locker.update locker_id: old_locker.id
				flash[:notice] = "Swap locker with #{previous_allocation_of_new_locker.user.uid}"
			else
				old_locker.update status: :vacant
			end
			@allocation.locker.update status: :occupied
			redirect_to mc_locker_locker_allocation_path(@allocation)
		else
			render 'edit'
		end
	end

	def destroy
		respond_to do |format|
			if @allocation.destroy
				@allocation.locker.update status: :vacant
				format.html { redirect_to mc_locker_locker_allocations_path, notice: "Allocation successfully destroyed" }
				format.js {}
			else
				format.html { redirect_to :back, notice: "Cannot destroy" }
			end
		end
	end

	private

	def set_allocation
		@allocation = LockerAllocation.find(params[:id])
	end

	def allocation_params
		params.require(:locker_allocation).permit(:user_id, :locker_id, :locker_round_id)
	end

end
