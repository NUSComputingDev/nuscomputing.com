class EnquiryMailer < ApplicationMailer
	default to: 'webmaster@nuscomputing.com'
		
	def notify(enquiry)
		@enquiry = enquiry
		mail(from: @enquiry.email, subject: '[Website Enquiry] New Enquiry coming from nuscomputing.com')
	end
end
