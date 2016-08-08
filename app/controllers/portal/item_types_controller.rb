class Portal::ItemTypesController < Portal::BaseController
  def index
  	@item_types = ItemType.all
  end

  def show
  	@item_type = ItemType.find(params[:id])
  end
end
