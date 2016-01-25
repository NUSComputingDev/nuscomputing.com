class PagesController < ApplicationController
  def index
      home()
  end

  def home
    @events = Event.all
  end
  
  def mcmem
    render "about"
  end
  
  def about
    @members = McMember.all
    @wings = McWing.all
  end
  
	def event
		render "events"
  end

  def students
  end

  def events
  end

  def sponsors
  	@sponsors = Sponsor.all
  end

  def connect
  end
  
  def enquiry
  	@enquiry = Enquiry.new(enquiry_params)
  	if @enquiry.save
  		EnquiryMailer.notify(@enquiry).deliver_now
  	end
  	render "connect"
  end
  
  private
  	def enquiry_params
  		params.require(:enquiry).permit(:name, :email, :contact, :message)
  	end
end
