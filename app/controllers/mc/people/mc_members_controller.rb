class Mc::People::McMembersController < Mc::BaseController
	before_action :set_mc_member, only: [:show, :edit, :update, :destroy]

	def new
		@mc_member = McMember.new
	end

	def show
	end

	def create
		@mc_member = McMember.new mc_member_params

		respond_to do |format|
			if @mc_member.save
				format.html { redirect_to mc_people_path, notice: 'New MC member added' }
				format.json { render json: @mc_member, status: :created, location: @mc_member }
				format.js {}
			else
				format.html { render 'new' }
				format.json { render json: @mc_member.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		if @mc_member.update(mc_member_params)
			redirect_to mc_people_mc_member_path(@mc_member)
		else
			render 'edit'
		end
	end

	def destroy
		respond_to do |format|
			if @mc_member.destroy
				format.html { redirect_to mc_people_path, notice: 'MC Member successfully deleted' }
				format.js {}
			else
				format.html { redirect_to :back, notice: 'Cannot delete' }
			end
		end
	end

	private

	def set_mc_member
		@mc_member = McMember.find(params[:id])
	end

	def mc_member_params
		params.require(:mc_member).permit(:name, :position, :wingid, :wingrank, :cellrank, :course, :year, :description, :casualimg, :formalimg)
	end

end
