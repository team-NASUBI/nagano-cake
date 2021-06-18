class Order < ApplicationRecord
  belongs_to :customer

  enum payment_method: {credit:0, bank:1}


  def self.total(cart_products)
    a = []

    cart_products.each do |cart_product|
      a << cart_product.product.price * cart_product.amount
    end

    (a.sum * 1.1).floor
  end
end
