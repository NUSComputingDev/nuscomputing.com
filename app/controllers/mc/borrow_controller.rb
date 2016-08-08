module Mc
	class BorrowController < BaseController
		before_action :fetch_data
		def home
		end

		def reload
			respond_to do |format|
				format.js 
			end
		end

		private
		def fetch_data
			@requests = ItemRequest.all
			@items = Item.all
			@types = ItemType.all
			@transactions = ItemTransaction.all
		end
	end
end
