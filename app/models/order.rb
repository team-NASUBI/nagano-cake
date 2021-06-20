class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products, dependent: :destroy

  enum payment_method: {credit:0, bank:1}
  enum status: {nyukinmati:0, nyukinkakunin:1,  seisakutyu:2, hassoujunbityu:3, hassouzumi:4}
  
  def self.total(cart_products)
    a = []

    cart_products.each do |cart_product|
      a << cart_product.product.price * cart_product.amount
    end

    (a.sum * 1.1).floor
  end
end
