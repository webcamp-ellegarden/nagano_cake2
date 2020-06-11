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
    @order = Order.new #(注文情報入力用)
    # @order.order_details.build いらないはず
    @delivery_addresses = DeliveryAddress.where(user_id: current_user.id)

    @delivery_address = DeliveryAddress.new #(3)新規配達先用
  end
 # (POST)注文確認画面表示--------------------0
  def confirmation
    @option = params[:option] #どの方法で配達先を選択したか受け取る。
    if @option == "1"  #(1)完成! ユーザーの住所をorderに入れる。
      @order = Order.new(order_params)
      @order.receiver = current_user.user_fullname 
      @order.postal_code = current_user.postal_code
      @order.delivery_address = current_user.user_address
    elsif @option == "2" #(2)完成! 既存の配達先から選ぶ
      address_select = DeliveryAddress.find(params[:address_select])
      @order = Order.new(order_params)
      @order.receiver = address_select.receiver
      @order.postal_code = address_select.postal_code
      @order.delivery_address = address_select.connect_address
    else #(3)完成！ 新規の住所をaddress_paramsで受け取りorderに入れる。
      @order = Order.new(order_params)
      @address = DeliveryAddress.new(address_params)
      @address.receiver = @order.receiver
      @order.postal_code = @address.postal_code
      @order.delivery_address = @address.connect_address
  	end
      @carts = Cart.where(user_id: current_user.id)
  	  render 'orders/confirmation' #カート情報と注文情報をviewに渡し再度隠しフォームに入れる。
  end


  # (POST)注文データ作成→注文確定ページ表示---------0
  def create
  	@order = Order.new(order_params)
    @carts = Cart.where(user_id: current_user.id)
    @order.total_price = @carts.map(&:subtotal).sum.to_i
    if @order.payment == "クレジットカード"
      Payjp.api_key = ENV['PAYJP_TEST_SECRETKEY']
      if Payjp::Charge.create(
          amount: @order.total_price + @order.postage, # 決済する値段
          card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
          currency: 'jpy'
        )
      else
        render root_path
      end
    end
  	@order.user_id = current_user.id
  	@order.save
    @carts.each do |cart|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.product_id = cart.product_id
      @order_detail.number = cart.number
      @order_detail.product_price = cart.product.product_price
      @order_detail.making_status = 1
      @order_detail.save
    end
    option = params[:option]
    if option == "3"
      address = DeliveryAddress.new(address_params)
      address.user_id = current_user.id
      address.save
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

  def address_params
    params.require(:delivery_address).permit(:receiver, :postal_code, :prefecture_code, :address_city, :address_street, :address_building)
  end
end
