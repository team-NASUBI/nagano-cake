class Admin::SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "Product"
      @search_products = Product.search(params[:word])
    else
      @search_customers = Customer.search(params[:word])
    end
  end
end
