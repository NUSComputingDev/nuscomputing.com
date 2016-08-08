class Mc::Borrow::ItemsController < Mc::BaseController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
  	@items = Item.all
  end

  def show
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)

  	respond_to do |format|
  		if @item.save
  			format.html { redirect_to :back, notice: "New item added" }
  			format.json { render json: @item, status: :created, location: @item }
  			format.js {}
			else
				format.html { render 'new' }
				format.json { render json: @item.errors, status: :unprocessable_entity }
			end
		end
	end

  def edit
  end

	def update
		if @item.update(item_params)
			redirect_to mc_item_path(@item)
		else
			render 'edit'
		end
	end


  private
  def set_item
		@item = Item.find(params[:id])
	end

	def item_params
		params.require(:item).permit(:label, :image, :item_type_id, :status, :state)
	end
end
