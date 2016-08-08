class Mc::PeopleController < Mc::BaseController

	def index
		@mc_members = McMember.order('wingid', 'wingrank', 'cellrank')
	end

end
