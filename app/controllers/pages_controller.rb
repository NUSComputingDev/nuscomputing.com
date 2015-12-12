class PagesController < ApplicationController
  def index
      home()
  end

  def home
  end

  def about
    @images = Dir.glob("app/assets/images/about/*")
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
