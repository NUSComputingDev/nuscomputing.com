class Mc::Borrow::ItemRequestsController < Mc::BaseController
	before_action :set_request, except: [:index, :new, :create]
	def index
	end

	def show
		
	end

	def new
		
	end

	def create
		
	end

	def edit
	
	end

	def update
			
	end

	def destroy
	end

	def approve
		if @request.pending?
			@request.status = :approved
			@request.processor = current_member
		end
		respond_action "approved" do
			create_transaction
		end
	end

	def reject
		if @request.pending?
			@request.status = :rejected
			@request.processor = current_member
		end
		respond_action "rejected" do
			@request.item.status = :available
			@request.item.save!
		end
	end

	def reset
		if @request.approved?
			@request.status = :pending
			@request.processor = nil
		end
		respond_action "reset" do
			destroy_transaction
		end
	end

	
	private
	def set_request
		@request = ItemRequest.find(params[:id])
	end

	def respond_action(action)
		respond_to do |format|
			if @request.save
				yield if block_given?
				format.html { redirect_to mc_borrow_path, notice: "#{action.capitalize}!" }
				format.json { render json: @request, status: :ok, location: @request }
				format.js { render action: "reload" }
			else
				format.html { redirect_to mc_borrow_path, notice: "Cannot process request" }
				format.json { render json: @request.errors, status: :unprocessable_entity }
				format.js { render action: "reload" }
			end
		end
	end

	def create_transaction
		@transaction = ItemTransaction.new
		@transaction.request = @request
		if @transaction.save
			# Do mailing here
			BorrowNotifier.request_approved(@request, @transaction.full_url).deliver_later
			@transaction.update pending_sent_at: DateTime.now, pending_expire_at: (DateTime.now + 2.days).beginning_of_day
		else
			reset
		end
	end

	def destroy_transaction
		ItemTransaction.find(@request.item_transaction).destroy if @request.item_transaction
	end
end
