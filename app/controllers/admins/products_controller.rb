class Admins::ProductsController < ApplicationController
  
  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	@product.save
  	redirect_to admins_products_path
  end
  
  def edit
  	@product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
     if @product.update(product_params)
      flash[:notice] = "successfully"
    redirect_to admins_product_path(@product)
   else
    render :edit
   end
  end

 private
 def product_params
 	   params.require(:product).permit(:product_name,:product_price,:category_id,:product_image_id,:product_status,:product_comment)
 	end
end
