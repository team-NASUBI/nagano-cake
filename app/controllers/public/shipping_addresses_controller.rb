class Public::ShippingAddressesController < ApplicationController
  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.where(customer_id: current_customer.id)
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end
  
  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      redirect_to shipping_addresses_path
    else
      render :edit
    end
  end
  
end
