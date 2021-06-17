class Product < ApplicationRecord
  belongs_to :genre
  has_many :carts, dependent: :destroy
  attachment :product_image
end
