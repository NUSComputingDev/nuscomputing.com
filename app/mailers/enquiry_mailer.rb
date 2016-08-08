class EnquiryMailer < ApplicationMailer
	# First define the value for "enquiry_mail_to" in secrets.yml
	default to: Rails.application.secrets.enquiry_mail_to
  default from: Rails.application.secrets.mailer_username
		
	def notify(enquiry)
		@enquiry = enquiry
		mail(reply_to: @enquiry.email, subject: '[Website Enquiry] Enquiry on nuscomputing.com')
	end
end
