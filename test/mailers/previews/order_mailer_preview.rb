# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/order_completed
  def order_completed
    order = Order.find(6)
    OrderMailer.order_completed(order)
  end

end
