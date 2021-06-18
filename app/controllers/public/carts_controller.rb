class Public::CartsController < ApplicationController
  def index
    @cart_products = session[:cart_id].map { |cart_id| Cart.find(cart_id) }
    @total_price = current_customer.carts.total(@cart_products)
  end

  def create
    cart_product =  current_customer.carts.new(cart_params)
    cart_product.save
    session[:cart_id] = [] unless session[:cart_id]
    session[:cart_id] << cart_product.id
    redirect_to carts_path
  end

  def update
    cart_product = Cart.find(params[:id])
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