class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum making_status: {not_production:0, waiting_for_production:1,  in_progress:2, production_completed:3}

  def change_order_status
    products = self.order.order_products
    if self.making_status == "in_progress"
      self.order.update(status: "in_production")
    elsif products.pluck(:making_status).all?{ |status| status == "production_completed"}
      self.order.update(status: "preparing_to_ship")
    end
  end

end
