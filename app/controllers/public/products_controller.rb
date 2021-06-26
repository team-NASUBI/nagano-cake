class Public::ProductsController < ApplicationController
  def index
    @genre_name = "商品"
    @products = Product.page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @price = @product.include_tax
    @cart = Cart.new
  end
  
  def search
    @genres = Genre.all
    genre = Genre.find(params[:product][:id])
    @products = genre.products.page(params[:page]).reverse_order
    @genre_name = genre.name
  end

end
