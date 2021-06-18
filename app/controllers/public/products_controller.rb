class Public::ProductsController < ApplicationController
  def index
    @genre_name = "商品"
    @products = Product.page(params[:page]).reverse_order
  end

  def show
    @product = Product.find(params[:id])
    @price = @product.include_tax
    @cart = Cart.new
  end

end
