require 'test_helper'

class UserMailsTest < ActionMailer::TestCase
  test "register" do
    mail = UserMails.register
    assert_equal "Register", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
