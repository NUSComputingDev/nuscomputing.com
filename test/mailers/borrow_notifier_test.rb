require 'test_helper'

class BorrowNotifierTest < ActionMailer::TestCase
  test "request_approved" do
    mail = BorrowNotifier.request_approved
    assert_equal "Request approved", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "request_rejected" do
    mail = BorrowNotifier.request_rejected
    assert_equal "Request rejected", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "transaction_summary" do
    mail = BorrowNotifier.transaction_summary
    assert_equal "Transaction summary", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "transaction_overdued" do
    mail = BorrowNotifier.transaction_overdued
    assert_equal "Transaction overdued", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
