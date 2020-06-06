class ProductsController < ApplicationController
  def index
  	@category = params[:category]
    if @category == "1" #ケーキ
    	@products = Product.where(category_id: 1).page(params[:page]).per(8).reverse_order
    elsif @category == "2" #焼き菓子
    	@products = Product.where(category_id: 2).page(params[:page]).per(8).reverse_order
    elsif @category == "3" #プリン
    	@products = Product.where(category_id: 3).page(params[:page]).per(8).reverse_order
    elsif @category == "4" #キャンディ
    	@products = Product.where(category_id: 4).page(params[:page]).per(8).reverse_order
    else #一覧表示
      @products = Product.page(params[:page]).per(8).reverse_order
    end
  end

  def show
    @product = Product.find(params[:id])
    @cart = Cart.new
  end

end
