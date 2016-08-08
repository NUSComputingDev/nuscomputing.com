class Mc::Blast::BlastEmailsController < Mc::BaseController
	def index
		@blast_emails = BlastEmail.all
	end
	def new
		@blast_email = BlastEmail.new
	end
end
