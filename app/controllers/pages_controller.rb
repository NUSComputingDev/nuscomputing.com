class PagesController < ApplicationController
  def index
      home()
  end

  def home
  end

  def about
  end

  def events
  end

  def connect
  end
  
  def enquiry
  	@enquiry = Enquiry.new(enquiry_params)
  	if @enquiry.save
  		sleep 2.0
  		redirect_to @enquiry
  	else
  		render "connect"
  	end
  end
  
  private
  	def enquiry_params
  		params.require(:enquiry).permit(:name, :email, :contact, :message)
  	end
end
