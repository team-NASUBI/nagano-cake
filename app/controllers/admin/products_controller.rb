class Admin::ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end
  
  def create
    product = Product.new(product_params)
    product.save
    redirect_to admin_product_path(product.id)
  end
  
  def show
    @product = Product.find(params[:id])
    case @product.genre_id
    when 1 then @genre = "未分類"
    when 2 then @genre = "ケーキ"
    when 3 then @genre = "プリン"
    when 4 then @genre = "焼き菓子"
    else @genre = "キャンディ"
    end
  end

  def edit
    @product = Product.find(params[:id])
  end
 
  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to admin_product_path(product.id)
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :introduction, :product_image, :genre_id, :price, :now_on_sale) 
  end
end
