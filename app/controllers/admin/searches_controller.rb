class Admin::SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "商品"
      @search_products = Product.search(params[:word])

    if @range == "商品" && @search_products.empty?
       @search_products = Genre.search(params[:word])
    end
    end
    if @range == "会員"
    @search_customers = Customer.search(params[:word])
    end
  end
end
