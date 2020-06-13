class ProductsController < ApplicationController
  def index
  	@category = params[:category]
    if @category == "1" #ケーキ
    	@products = Product.joins(:category).where(categories: {category_status: "有効"}).where(category_id: 1).page(params[:page]).per(8).reverse_order
    elsif @category == "2" #焼き菓子
    	@products = Product.joins(:category).where(categories: {category_status: "有効"}).where(category_id: 2).page(params[:page]).per(8).reverse_order
    elsif @category == "3" #プリン
    	@products = Product.joins(:category).where(categories: {category_status: "有効"}).where(category_id: 3).page(params[:page]).per(8).reverse_order
    elsif @category == "4" #キャンディ
    	@products = Product.joins(:category).where(categories: {category_status: "有効"}).where(category_id: 4).page(params[:page]).per(8).reverse_order
    elsif @category == "5"
      search = params[:search]
      @products = Product.where('product_name LIKE ?', "%#{search}%").page(params[:page]).per(8).reverse_order
    else #一覧表示
      @products = Product.joins(:category).where(categories: {category_status: "有効"}).page(params[:page]).per(8)
    end
  end

  def show
    @product = Product.find(params[:id])
    @cart = Cart.new
    if user_signed_in?
      @cartfilter = Cart.where(product_id: @product.id).find_by(user_id: current_user.id)
    end
  end

end
