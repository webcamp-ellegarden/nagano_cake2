class OrdersController < ApplicationController
  def index
  	@orders = Order.where(user_id: current_user.id)
  end

  def show
  	@order = Order.find(params[:id])
  end

	def new
	end

	def update
	end

	def confirmation
	end

	def completation
	end
end
