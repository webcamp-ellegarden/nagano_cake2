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
  	@cart = Cart.find(current_user.id)
  	@order = Order.new(params)
  	render 'orders/confirmation'
  end
  # (POST)注文データ作成→注文確定ページ表示---------0
  def create
  	
  	order.save

  	current_user.carts.destroy_all
  	render 'orders/complecation'
  end
#------------------------------------------
#ストロングパラメーター---------------------------
  private 
  def order_params
  	params.require(:order).permit()
  end

end
