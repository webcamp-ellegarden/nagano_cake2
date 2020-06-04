class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  end

  def update
     @order = Order.find(params[:id])
     option = params[:option]
    if option == "2" 
      @order_detail = OrderDetail.find(order_details_params[:id])
      @order_detail.update(order_details_params)
    else
     
      @order.update(order_params)
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
