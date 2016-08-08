class Mc::BlastController < Mc::BaseController
	def home
		@blast_emails = BlastEmail.all
		@blast_requests = current_member.role.name == "pcell" ? BlastRequest.all : BlastRequest.where(member_id: current_member.id)
	end
end
