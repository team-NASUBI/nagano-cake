class Product < ApplicationRecord
  belongs_to :genre
  attachment :product_image
end
