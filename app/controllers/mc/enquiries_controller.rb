class Mc::EnquiriesController < Mc::BaseController
	before_action :set_enquiry, except: :index

	def index
		@enquiries = Enquiry.all.reverse
	end

	def show
	end

	def destroy
	end

	private
	def set_enquiry
		@enquiry = Enquiry.find(params[:id])
	end

	def enquiry_params
		params.require(:enquiry).permit(:name, :message, :email)
	end

end
