class ProductsController < ApplicationController
  def new
    @product = Product.new
  end
  def create
    product_params = params.require(:product,:category).permit([:title,:body,:name])
    @product = Product.new product_params
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end
  def show
    @product = Product.find params[:id]
    @review = Review.new
    # render json: params
  end
  def index
    @product = Product.last(50)
  end
  def edit
    @product = Product.find params[:id]
  end
  def update
    @product = Product.find params[:id]
    product_params = params.require(:product).permit([:title, :description, :price])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end
  def destroy
    product = Product.find params[:id]
    product.destroy
    redirect_to products_path

  end
end
