class Mc::SponsorsController < Mc::BaseController
	before_action :set_sponsor, only: [:show, :edit, :update, :destroy]

	def index
		@sponsors = Sponsor.all
	end

	def show
		@sponsors = Sponsor.all.order('created_at desc')
	end

	def new
		@sponsor = Sponsor.new
	end

	def create
		@sponsor = Sponsor.new(sponsor_params)

		respond_to do |format|
			if @sponsor.save
				format.html { redirect_to [:mc, @sponsor], notice: 'Sponsor is successfully created' }
				format.json { render json: @sponsor, status: :created, location: @sponsor }
			else
				format.html { render 'new' }
				format.json { render json: @sponsor.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		if @sponsor.update(sponsor_params)
			redirect_to mc_sponsor_path
		else
			render 'edit'
		end
	end

	def destroy
		@sponsor.destroy
		redirect_to mc_sponsors_path
  end

  private
	def set_sponsor
		@sponsor = Sponsor.find(params[:id])
	end

	def sponsor_params
		params.require(:sponsor).permit(:name, :img, :website, :description)
	end
end
