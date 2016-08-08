class Portal::ItemRequestsController < Portal::BaseController
	before_action :authenticate_user!
	def show
		@request = ItemRequest.find(params[:id])
	end

	def create
		# Checking if Item is available and OK
		item = Item.find(params[:item_request][:item_id])	
		if item.borrowable?
			@request = ItemRequest.new user_id: current_user.id, item_id: item.id

			respond_to do |format|
				if @request.save
					item.status = :requested
					item.save!
					format.html { redirect_to :back, notice: "Requested!" }
					format.json { render json: @request, status: :created, location: @request }
				else
					format.html { redirect_to :back }
					format.json { render json: @request.errors, status: :unprocessable_entity }
				end
			end
		end
	end
end
