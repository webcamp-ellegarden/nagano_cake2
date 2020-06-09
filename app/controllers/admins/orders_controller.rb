class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!
  
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  end


  def update
     @order = Order.find(params[:id]) #params[:id]から注文呼び出し(常にtrue)
     option = params[:option]
    if option == "1"   #製作ステータスの編集だった場合
      @order_detail = OrderDetail.find(order_details_params[:id]) #注文詳細呼び出し
      @order_detail.update(order_details_params) #paramsの内容でアップデート
      if @order_detail.making_status == "製作中"
        @order.update(order_status: "製作中")
      elsif @order_detail.making_status == "製作完了"
        @order.update(order_status: "発送準備中")
        @order.order_details.each do |order_detail|
          if order_detail.making_status == "製作中" || order_detail.making_status == "製作待ち"
            @order.update(order_status: "製作中")
          end
        end
      end
   
    else
      @order.update(order_params)
      if @order.order_status == "入金確認"
        order_details = OrderDetail.where(order_id: @order.id)
        order_details.each do |order_detail|
          order_detail.update(making_status: "製作待ち")
        end
      end
    end
      redirect_to admins_order_path(@order)
   end

    private
     def order_params
       params.require(:order).permit(:order_status)
     end
     def order_details_params
       params.require(:order_detail).permit(:id,:making_status)
     end
end
