require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "order_completed" do
    mail = OrderMailer.order_completed
    assert_equal "Order completed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
