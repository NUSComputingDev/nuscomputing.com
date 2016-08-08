module Mc
	class Borrow::ItemTransactionsController < BaseController
		def index
		end

		def show
			begin
				@item_transaction = ItemTransaction.find_by(token: params[:id])
			rescue ActiveRecord::RecordNotFound
				redirect_to mc_borrow_path, notice: "Transaction Not Found"
			end
		end

		def update
			@item_transaction = ItemTransaction.find(params[:id])
			end_at = params[:item_transaction][:transaction_end_at]
			respond_to do |format|
				if end_at > DateTime.now
					@item_transaction.update transaction_began_at: DateTime.now, transaction_end_at: end_at, status: :in_process
				end
				format.js { render action: 'reload' }
			end
		end

		def complete
			@item_transaction = ItemTransaction.find(params[:id])
			respond_to do |format|
				@item_transaction.update(status: :completed, transaction_completed_at: DateTime.now)
				@item_transaction.item.update status: :available
				@item_transaction.request.update status: :completed
				format.js { render action: 'reload' }
			end
		end
	end
end
