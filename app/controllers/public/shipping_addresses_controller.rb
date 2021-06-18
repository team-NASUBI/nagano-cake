class Public::ShippingAddressesController < ApplicationController
  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.where(customer_id: current_customer.id)
  end
  
  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    if @shipping_address.save
      redirect_to shipping_addresses_path
    else
      render :index
    end
  end
  

  def edit
  end
  
  private
  def shipping_address_params
    params.require(:shipping_address).permit(:shipping_name, :postal_code, :address)
  end
end
