class FeedbacksController < ApplicationController
	def create
		@feedback = Feedback.new(feedback_params)

		respond_to do |format|
			if @feedback.save
				format.html { redirect_to :back, notice: "Feedback sucessfully created!" }
				format.json { render json: @feedback, status: :created, location: @feedback }
			else
				format.html { render 'new' }
				format.json { render json: @feedback.errors, status: :unprocessable_entity }
			end
		end
	end
	
	def new
		@feedback = Feedback.new
	end

	private
	def feedback_params
		params.require(:feedback).permit(:title, :content, :email)
	end
end
