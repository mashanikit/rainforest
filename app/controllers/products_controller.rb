class ProductsController < ApplicationController

  def index
    @Products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/products"
    else
      # otherwise render new.html.erb
      render :new
    end
  end
  def edit
    @product = Product.find(params[:id])
  end


  def destroy
   @product = Product.find(params[:id])
   @product.destroy
   redirect_to "/products"
  end

  def update
  @product = Product.find(params[:id])
  @product.update(product_params)
  redirect_to "/"
  end


  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end
end
