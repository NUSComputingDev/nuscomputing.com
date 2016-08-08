class Mc::EventsController < Mc::BaseController
	before_action :set_event, only: [:show, :edit, :update, :destroy]

	def index
		@events = Event.all
		@featured_events = Event.where('featured')
	end

	def show
		@events = Event.all.order('created_at desc')
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)

		respond_to do |format|
			if @event.save
				format.html { redirect_to [:mc, @event], notice: 'Event is successfully created' }
				format.json { render json: @event, status: :created, location: @event }
			else
				format.html { render 'new' }
				format.json { render json: @event.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		if @event.update(event_params)
			redirect_to mc_event_path
		else
			render 'edit'
		end
	end

	def destroy
		@event.destroy
		redirect_to mc_events_path
  end

  private
	def set_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:name, :img, :externalpage, :featured, :description)
	end
end
