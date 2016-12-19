class Mc::ProductsController < Mc::BaseController
  before_action :get_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to 'index'
  end

  private
  def product_params
    params.require(:product).permit(
      :name, :images, :description, :options, :price, :stock, :orders)
  end

  def get_product
    @product = Product.find(params[:id])
  end
end
