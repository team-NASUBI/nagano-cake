class Product < ApplicationRecord
  belongs_to :genre
  has_many :carts, dependent: :destroy
  attachment :product_image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :now_on_sale, presence: true
  def include_tax
    (self.price * 1.1).floor
  end

  def self.search(search)
      Product.where(['id LIKE(?) OR name LIKE(?) OR now_on_sale LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%"])
  end

end
