class Order < ApplicationRecord
  belongs_to :customer
  
  enum payment_method: {credit:0, bank:1}
  
end
