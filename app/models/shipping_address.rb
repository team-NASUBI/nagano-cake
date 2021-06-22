class ShippingAddress < ApplicationRecord
  belongs_to :customer
  
  validates :shipping_name, presence: true
  validates :postal_code, presence: true, length: { is: 7 }
  validates :address, presence: true
end
