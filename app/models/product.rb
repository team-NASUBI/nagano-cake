class Product < ApplicationRecord
  belongs_to :genre
  has_many :carts, dependent: :destroy
  attachment :product_image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :now_on_sale, default: false, null: false
  def include_tax
    (self.price * 1.1).floor
  end

  def self.search(word)
    if word =~  /^[0-9]+$/
      @search_products = Product.where("id LIKE? OR price LIKE?","%#{word}%","%#{word}%")
    elsif word == "true" || word == "販売中"
      @search_products = Product.where(now_on_sale: true)
    elsif word == "false" || word == "販売停止中"
      @search_products = Product.where(now_on_sale: false)
    else
      @search_products = Product.where("name LIKE?","%#{word}%")
    end
  end

end
