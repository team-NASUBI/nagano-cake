class Product < ApplicationRecord
  belongs_to :genre
  has_many :carts, dependent: :destroy
  attachment :product_image

  def include_tax
    (self.price * 1.1).floor
  end

end
