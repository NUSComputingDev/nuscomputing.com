class Portal::BaseController < ApplicationController
	layout 'portal'

	def home
    if !user_signed_in?
      redirect_to portal_login_path
    end
	end

	def login
		if user_signed_in?
			redirect_to portal_root_path
		end
	end

end
