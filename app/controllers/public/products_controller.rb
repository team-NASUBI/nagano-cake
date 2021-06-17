class Public::ProductsController < ApplicationController
  def index
    @genre_name = "商品"
    @products = Product.page(params[:page]).reverse_order
  end

  def show
    @product = Product.find(params[:id])
    @price_including_tax = @product.price * 1.1
  end

end
