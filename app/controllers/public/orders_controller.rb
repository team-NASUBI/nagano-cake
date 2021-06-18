class Public::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new
  end

  def confirm
    @cart_products = session[:cart_id].map{ |cart_id| Cart.find(cart_id) }
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping = 800
    @order.payment_method = params[:order][:payment_method]
    @total_price = current_customer.carts.total(@cart_products)

    if params[:order][:address_option] == 0
      @order.postal_code = current_customer.postal_code
      @order.adress = current_customer.adress
      @order.name = full_name(current_customer)
      render 'confirm'

    elsif params[:order][:address_option] == 1
      @shipping_address = ShippingAdress.find(params[:order][:id])
      @order.postal_code = @shipping_address.postal_code
      @order.address = @shipping_address.address
      @order.name = @shipping_address.shipping_name
      render 'confirm'

    elsif params[:order][:address_option] == 2
      @shipping_address = current_customer.shipping_address.new
      @shipping_address.postal_code = params[:order][:postal_code]
      @shipping_address.address = params[:order][:address]
      @shipping_address.shipping_name = params[:order][:shipping_name]
      @shipping_address.save!
      @order.postal_code = @shipping_address.postal_code
      @order.address = @shipping_address.adddress
      @order.name = @shipping_address.shipping_name
    end

  end

  def create

  end


  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :total_price, :payment_method)
  end
end
