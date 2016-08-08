class Mc::Locker::LockersController < Mc::BaseController
	before_action :set_locker, only: [:show, :edit, :update, :destroy]

	def index
		@lockers_by_location = ::Locker.lockers_by_location
		@lockers = ::Locker.all
	end

	def new
		@locker = ::Locker.new
	end

	def show
	end

  def create
    @locker = Locker.new locker_params

    respond_to do |format|
      if @locker.save
        format.html { redirect_to mc_locker_lockers_path, notice: "New Locker #{@locker.number} added" }
        format.json { render json: @locker, status: :created, location: @locker }
        format.js {}
      else
        format.html { render 'new' }
        format.json { render json: @locker.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @locker.update locker_params
        format.html { redirect_to mc_locker_locker_path, notice: "Locker #{@locker.number} edited" }
        format.json { render json: @locker, status: :created, location: @locker }
        format.js {}
      else
        format.html { render 'edit' }
        format.json { render json: @locker.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @locker.allocations.any?
        format.html { redirect_to :back, alert: "Delete allocations for Locker #{@locker.number} before deleting locker" }
      elsif @locker.destroy
        format.html { redirect_to mc_locker_lockers_path, notice: "Locker #{@locker.number} successfully destroyed" }
        format.js {}
      else
        format.html { redirect_to :back, notice: 'Cannot destroy' }
      end
    end
  end

	private
	def set_locker
		@locker = ::Locker.find(params[:id])
	end
  def locker_params
    params.require(:locker).permit(:location, :number, :status)
  end
end
