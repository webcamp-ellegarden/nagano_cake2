class ProductsController < ApplicationController
  def index
  	@category = params[:category]
  	if @category == "0" #一覧表示
      @products = Product.page(params[:page]).reverse_order
    elsif @category == "1" #ケーキ
    	@products = Product.where(category_id: 1)
    	@products = Product.page(params[:page]).per(8)
    elsif @category == "2" #焼き菓子
    	@products = Product.where(category_id: 2)
    	@products = Product.page(params[:page]).per(8)
    elsif @category == "3" #プリン
    	@products = Product.where(category_id: 3)
    	@products = Product.page(params[:page]).per(8)
    else #キャンディ
    	@products = Product.where(category_id: 4)
    	@products = Product.page(params[:page]).per(8)
    end
  end

  def show
  end

end
