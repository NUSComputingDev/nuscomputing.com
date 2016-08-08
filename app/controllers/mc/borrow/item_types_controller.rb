class Mc::Borrow::ItemTypesController < Mc::BaseController
  before_action :set_type, only: [:show, :update, :edit, :destroy]
  def index
  	@item_types = ItemType.all
  end

  def show
  end

  def new
  	@item_type = ItemType.new
  end

  def create
  	@item_type = ItemType.new(type_params)

		respond_to do |format|
			if @item_type.save
				format.html { redirect_to :back, notice: "New item type is successfully created" }
				format.json { render json: @item_type, status: :created, location: @item_type }
				format.js {}
			else
				format.html { render 'new' }
				format.json { redner json: @item_type.errors, status: :unprocessable_entity }
			end
		end
  end

  def edit
  end

	def update
		if @item_type.update(type_params)
			redirect_to mc_borrow_item_type_path(@item_type)
		else
			render 'edit'
		end
	end

  def destroy
  	@item_type.destroy
  	redirect_to mc_borrow_item_types_path 
  end

  private
  def set_type
		@item_type = ItemType.find(params[:id])
	end

	def type_params
		params.require(:item_type).permit(:name, :description, :image)
	end
end
