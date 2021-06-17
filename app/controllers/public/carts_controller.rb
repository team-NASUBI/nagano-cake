class Public::CartsController < ApplicationController
  def index

  end
  
  def create
    redirect_to carts_path
  end
end
