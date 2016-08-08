class Mc::FeedbacksController < Mc::BaseController
	before_action :set_feedback, except: :index

	def index
		@feedbacks = Feedback.all
	end

	def show
	end

	def destroy
	end

	private
	def set_feedback
		@feedback = Feedback.find(params[:id])
	end

	def feedback_params
		params.require(:feedback).permit(:title, :content, :email)
	end

end
