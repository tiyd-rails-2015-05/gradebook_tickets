require 'test_helper'

class ParentMailerTest < ActionMailer::TestCase
  test "send email to parent" do
    mail = ParentMailer.weekly_email("email")
    assert_equal "Your child's weekly progress!", mail.subject
    assert_equal ["email"], mail.to
    assert_match "Welcome", mail.body.encoded
 end
end
