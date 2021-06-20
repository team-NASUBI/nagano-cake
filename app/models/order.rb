class Order < ApplicationRecord
  belongs_to :customer


  def self.total(cart_products)
    a = []

    cart_products.each do |cart_product|
      a << cart_product.product.price * cart_product.amount
    end

    (a.sum * 1.1).floor
  end
  
  

  has_many :order_products, dependent: :destroy

 

  
  enum payment_method: {クレジットカード:0, 銀行振込:1}
  enum order_status: {入金待ち:0, 入金確認:1,  製作中:2, 発送準備中:3, 発送済み:4}
end
