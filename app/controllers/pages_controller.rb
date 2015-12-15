class PagesController < ApplicationController
  def index
      home()
  end

  def home
    @events = Event.all;
  end

  def about
  end

  def events
  end

  def connect
  end
  
  def enquiry
  	@enquiry = Enquiry.new(enquiry_params)
  	@enquiry.save
  	redirect_to @enquiry
  end
  
  private
  	def enquiry_params
  		params.require(:enquiry).permit(:name, :email, :contact, :message)
  	end
end
