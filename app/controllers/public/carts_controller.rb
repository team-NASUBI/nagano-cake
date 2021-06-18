class Public::CartsController < ApplicationController
  def index
    @cart_products = session[:cart_id].map{ |cart_id| Cart.find(cart_id) }
    @total_price = current_customer.carts.total(@cart_products)
  end

  def create
    cart_product =  current_customer.carts.build(cart_params)
    cart_product.save

    if session[:cart_id]
      session[:cart_id] << cart_product.id
    else
      session[:cart_id] =[]
      session[:cart_id] << cart_product.id
    end

    redirect_to carts_path
  end

  def update
    cart_product = Cart.find(params[:id])
    cart_product.update(cart_params)
    redirect_to carts_path
  end

  def destroy_all
    current_customer.carts.destroy_all
    session[:cart_id].clear
    redirect_to carts_path
  end

  def destroy
    cart_product = Cart.find(params[:id])
    session[:cart_id].delete(cart_product.id)
    cart_product.destroy
    redirect_to carts_path
  end


  private

  def cart_params
    params.require(:cart).permit(:amount, :product_id)
  end
end