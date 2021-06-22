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
      flash[:notice] = "配送先を追加しました"
    else
      @shipping_addresses = ShippingAddress.where(customer_id: current_customer.id)
      render :index
    end
  end
  

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end
  
  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      redirect_to shipping_addresses_path
      flash[:notice] = "配送先を編集しました"
    else
      render :edit
    end
  end
  
  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.customer_id == current_customer.id
      @shipping_address.destroy
      redirect_to shipping_addresses_path
      flash[:notice] = "配送先を削除しました"
    end
  end
  
  private
  def shipping_address_params
    params.require(:shipping_address).permit(:shipping_name, :postal_code, :address)
  end
end
