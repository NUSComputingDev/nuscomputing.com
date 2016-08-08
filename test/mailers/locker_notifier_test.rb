require 'test_helper'

class LockerNotifierTest < ActionMailer::TestCase
  test "successful_ballot" do
    mail = LockerNotifier.successful_ballot
    assert_equal "Successful ballot", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "unsuccessful_ballot" do
    mail = LockerNotifier.unsuccessful_ballot
    assert_equal "Unsuccessful ballot", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
