class Public::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def confirm
    @cart_products = current_customer.carts
    @order = current_customer.orders.build(order_params)
    @order.shipping = 800
    @order.payment_method = params[:order][:payment_method]
    @total_price = current_customer.carts.total(@cart_products)

    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = @order.customer.full_name(current_customer)
      render 'confirm'

    elsif params[:order][:address_option] == "1"
      @shipping_address = ShippingAddress.find(params[:order][:id])
      @order.postal_code = @shipping_address.postal_code
      @order.address = @shipping_address.address
      @order.name = @shipping_address.shipping_name
      render 'confirm'

    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      render 'confirm'

    end
  end

  def create
    order = current_customer.orders.build(order_params)
    order.save
    cart_products = current_customer.carts
    cart_products.each do |cart_product|
      order_product = OrderProduct.new(product_id: cart_product.product.id, order_id: order.id)
      order_product.price = cart_product.product.include_tax
      order_product.amount = cart_product.amount
      order_product.save
    end
    cart_products.destroy_all
    redirect_to orders_thanks_path
  end


  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :total_price, :payment_method, :shipping)
  end
end
