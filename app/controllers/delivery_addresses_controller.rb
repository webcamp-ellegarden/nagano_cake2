class DeliveryAddressesController < ApplicationController
	def index
      @address = DeliveryAddress.new
      @addresses = DeliveryAddress.where(user_id: current_user.id)
	end

	def edit
      @address = DeliveryAddress.find(params[:id])
    end


    def update
        @address = DeliveryAddress.find(params[:id])
      if @address.update(delivery_address_params)
        flash[:notice] = "successfully"
        redirect_to delivery_addresses_path
      else
        render :edit
      end
    end
 

    def destroy
      @address = DeliveryAddress.find(params[:id])
      @address.destroy
      redirect_to delivery_addresses_path
    end

    def create
      @address = DeliveryAddress.new(delivery_address_params)
      @address.user_id = current_user.id
      @address.save
      redirect_to delivery_addresses_path
    end
    
    private
     def delivery_address_params
       params.require(:delivery_address).permit(:postal_code,:prefecture_code,:address_city,:address_street,:address_building,:receiver)
     end
end
