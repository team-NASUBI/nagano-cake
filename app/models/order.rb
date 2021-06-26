class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  validates :postal_code, presence: true, length: { is: 7 }, format: { with: VALID_POSTAL_CODE_REGEX }
  validates :shipping, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :total_price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :payment_method, presence: true
  validates :status, presence: true

  enum payment_method: {credit:0, bank:1}
  enum status: {waiting_for_payment:0, payment_confirmation:1, in_production:2, preparing_to_ship:3, shipped:4}

  def self.total(cart_products)
    a = []

    cart_products.each do |cart_product|
      a << cart_product.product.price * cart_product.amount
    end

    (a.sum * 1.1).floor
  end

  def change_making_status
    if self.status == "waiting_for_payment"
      self.order_products.update_all(making_status: :not_production)
    elsif self.status == "payment_confirmation"
      self.order_products.update_all(making_status: :waiting_for_production)
    end
  end

end
