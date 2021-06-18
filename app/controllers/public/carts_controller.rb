class Public::CartsController < ApplicationController
  def index
    @cart_products= current_customer.carts
    @total_price = current_customer.carts.total(@cart_products)
  end

  def create
    cart_product =  current_customer.carts.new(cart_params)
    cart_product.save
    session[:cart] = [] unless session[:cart]
    session[:cart] << cart_product.id
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