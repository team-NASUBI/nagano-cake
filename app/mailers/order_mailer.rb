class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_completed.subject
  #
  def order_completed(order)
    @order = order
    @customer = order.customer

    mail to: order.customer.email, subject: '[ながのケーキ]注文が確定しました！'
  end
end
