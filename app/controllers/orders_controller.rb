class OrdersController < ApplicationController

#注文履歴--------------------------------------------------------
  def index
  	@orders = Order.where(user_id: current_user.id)
  end

  def show
  	@order = Order.find(params[:id])
  end
#-----------------------------------------------------------

#注文作成----------------------------------------------------
  
  # (GET)注文情報入力表示--------------0
  def new
    @order = Order.new
    @order.order_details.build
  end
 # (POST)注文確認画面表示--------------------0
  def confirmation
  	@carts = Cart.where(user_id: current_user.id)
  	@order = Order.new(order_params)
  	render 'orders/confirmation'
  end
  # (POST)注文データ作成→注文確定ページ表示---------0
  def create
  	@order = Order.new(order_params)
  	@order.user_id = current_user.id
  	@order.save
    @carts = Cart.where(user_id: current_user.id)
    @carts.each do |cart|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.product_id = cart.product_id
        @order_detail.number = cart.number
        @order_detail.product_price = cart.product.product_price
        @order_detail.making_status = 1
        @order_detail.save
    end
  	current_user.carts.destroy_all
  	render 'orders/completation'
  end
#------------------------------------------
#ストロングパラメーター---------------------------
  private 
  def order_params
  	params.require(:order).permit(:payment, :receiver, :postal_code, :delivery_address)
  end

end
