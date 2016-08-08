class Mc::BaseController < ApplicationController
	layout 'mc'

	def home
    if !member_signed_in?
      redirect_to mc_login_path
    else
		  @feedbacks = Feedback.all
    end
	end

	def login
		if member_signed_in?
			redirect_to mc_root_path
		end
	end

end
