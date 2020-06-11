class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @option = params[:option]
    if @option == "search"
      search = params[:search]
      @products = Product.where('product_name LIKE ?', "%#{search}%").page(params[:page]).per(8).reverse_order
  	else
      @products = Product.page(params[:page]).per(8)
    end
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
    @categories = Category.all
    @category = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	@product.save
  	redirect_to  admins_product_path(@product)
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
 	   params.require(:product).permit(:product_name,:product_price,:category_id,:product_image,:product_status,:product_comment)
 	end
end
