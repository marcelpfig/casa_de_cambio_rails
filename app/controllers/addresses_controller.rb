class AddressesController < ApplicationController

    def index
        @addresses = Adress.all
    end

    def show
        @address = Address.find(params[:id])
    end
    
    def new
        @address = Address.new
    end
    
    def create
        @address = Address.new(address_params)
        if @address.save
          redirect_to @address
        else
          render :new
        end
    end

    private
    
    def address_params
        params.require(:address).permit(:street, :city, :state, :neighbourhood, :postal_code)
    end
end