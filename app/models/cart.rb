class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  
  
  
  def subtotal
    (self.product.price * self.amount * 1.1).floor.to_s(:delimited) 
  end
  
  def self.total(cart_products)
    a = []
    
    cart_products.each do |cart_product|
      a << cart_product.product.price * cart_product.amount
    end
    
    (a.sum * 1.1).floor
  end
  
end
