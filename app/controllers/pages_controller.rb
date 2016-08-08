class PagesController < ApplicationController
	def index
		home()
	end

	def home
		@events = Event.all
	end

	def mcmem
		render 'about'
	end

	def about
		@members = McMember.order('wingid', 'wingrank', 'cellrank')
		@wings = McWing.order('wingid')
	end

	def event
		@events = Event.all
		render 'events'
	end

	def students
	end

	def events
		@events = Event.all
	end

	def sponsors
		@sponsors = Sponsor.all
	end

	def connect
	end

	def enquiry
		@enquiry = Enquiry.new(enquiry_params)
    # send mail before saving to database.
    # because I think it's more likely that the mailing fails than it can't save to db
    # also to prevent multiple entries in db.
		if EnquiryMailer.notify(@enquiry).deliver_now
      @enquiry.save
		end
		render 'connect'
	end

	private
	def enquiry_params
		params.require(:enquiry).permit(:name, :email, :contact, :message)
	end
end
