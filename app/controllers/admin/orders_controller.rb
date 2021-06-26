class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
    if params[:customer_id].present?
      customer = Customer.find(params[:customer_id])
      @orders = customer.orders.page(params[:page]).per(10)
    else
     @orders = Order.page(params[:page]).per(10)
    end
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


  def update
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    if @order.update(order_params)
      @order.change_making_status
      redirect_to admin_order_path(@order)
    else
      render 'show'
    end
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
