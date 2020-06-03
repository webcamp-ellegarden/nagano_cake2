class CartsController < ApplicationController
  # カートページ
  def index
    @carts = Cart.where(user_id: current_user.id)
    @total_price = @carts.map(&:subtotal).sum.to_i
  end
  #商品詳細→プルダウンの個数、保存
  def create
    @cart = Cart.new(cart_params)
    @cart.user_id = current_user.id
    @cart.product_id = params[:product_id]
    @cart.save
    redirect_to carts_path
  end

#個数変更
  def update
  	@cart = Cart.find(params[:id])
  	@cart.update(cart_params)
  	redirect_to carts_path
  end
#商品1つ削除
  def destroy
  cart = Cart.find(params[:id])
	cart.destroy
	redirect_back(fallback_location: root_path)
  end
#カートを空にする
  def reset
  	current_user.carts.destroy_all
  	redirect_back(fallback_location: root_path)
  end

  private
  def cart_params
    params.require(:cart).permit(:number)
  end
end
