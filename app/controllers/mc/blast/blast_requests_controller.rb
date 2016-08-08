class Mc::Blast::BlastRequestsController < Mc::BaseController
	before_action :set_request, only: [:show, :edit, :update, :destroy]

	def index
		# Makeshift authorization. Need to improve
		if current_member.role.name === "pcell"
			@blast_requests = BlastRequest.all
		else
			@blast_requests = BlastRequest.where(member_id: current_member.id)
		end
	end

	def show
	end

	def new
		@blast_request = BlastRequest.new
	end

	def create
		@blast_request = BlastRequest.new(request_params)	
		@blast_request.requester = current_member

		respond_to do |format|
			if @blast_request.save
				format.html { redirect_to mc_blast_blast_request_path(@blast_request), notice: 'Blast request was successfully created.' }
				format.json { render :show, status: :created, location: @blast_request }
			else
				format.html { render :new }
				format.json { render json: @blast_request.errors, status: :unprocessable_entity }
			end
		end
	end

  def update
    respond_to do |format|
      if @blast_request.update(request_params)
        format.html { redirect_to mc_blast_blast_request_path(@blast_request), notice: 'Blast request was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @blast_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @blast_request.destroy
    respond_to do |format|
      format.html { redirect_to mc_blast_blast_requests_path, notice: 'Blast request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	private
	def set_request
		@blast_request = BlastRequest.find(params[:id])
	end

	def request_params
		params.require(:blast_request).permit(:image, :text, :status)
	end

end
