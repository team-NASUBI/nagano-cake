class Public::HomesController < ApplicationController
  def top
    @products = Product.all.limit(4)
  end

  def about
  end
end
