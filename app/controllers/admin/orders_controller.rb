class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @shipping = 800
    @order = Order.find_by(id: params[:id])
    if @order
      @order_products = OrderProduct.where(order_id: @order.id)
    else
      redirect_to admin_customer_path(params[:id])
    end
  end
  
  def new
    @order = Order.new
  end
  
  def confirm
    @order_products = session[:cart_id].map{ |cart_id| Cart.find(cart_id) }
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping = 800
    @order.payment_method = params[:order][:payment_method]
    @order.total_price = @order_products.total
    
    if params[:order][:address_option] == 0
      
    
  
  end
  
  def create

  end
  
    
  
  private
  
  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :total_price, :payment_method)
  end
end
