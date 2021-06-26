class Genre < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, presence: true

  def self.search(word)
    search = Genre.where(name: "#{word}")
    @search_products = Product.where( genre_id: search)
  end
end
