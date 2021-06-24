class Public::CartsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_products = current_customer.carts
    @total_price = current_customer.carts.total(@cart_products)
  end

  def create
    cart_product =  current_customer.carts.build(cart_params)
    if current_customer.carts.find_by(product_id: params[:cart][:product_id]).present?
      cart_product = current_customer.carts.find_by(product_id: params[:cart][:product_id])
      cart_product.amount += params[:cart][:amount].to_i
      cart_product.save
      redirect_to carts_path
    else
      if cart_product.save
        redirect_to carts_path
      else
        redirect_to product_path(params[:cart][:product_id])
      end
    end
  end

  def update
    cart_product = current_customer.carts.find(params[:id])
    cart_product.update(cart_params)
    redirect_to carts_path
  end

  def destroy_all
    current_customer.carts.destroy_all
    redirect_to carts_path
  end

  def destroy
    cart_product = Cart.find(params[:id])
    cart_product.destroy
    redirect_to carts_path
  end


  private

  def cart_params
    params.require(:cart).permit(:amount, :product_id)
  end
end