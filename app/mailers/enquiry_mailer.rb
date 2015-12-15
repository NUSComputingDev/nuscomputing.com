class EnquiryMailer < ApplicationMailer
	default to: 'webmaster@nuscomputing.com'
		
	def notify(enquiry)
		@enquiry = enquiry
		mail(from: @enquiry.email, subject: 'New Enquiry')
	end
end
