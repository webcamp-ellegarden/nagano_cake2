class DeliveryAddressesController < ApplicationController
	def index
      @address = DeliveryAddress.new
      @addresses = DeliveryAddress.all
	end

	def edit
    end

    def update
    end

    def destroy
    end

    def create
      @address = DeliveryAddress.new(delivery_address_params)
      @address.save
      redirect_to delivery_addresses_path
    end

    private
    def delivery_address_params
       params.require(:delivery_address).permit(:portal_code,:prefecture_code,:address_city,:address_street,:address_building,:receiver)
    end

end
