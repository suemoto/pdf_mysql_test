require 'test_helper'

class ArtNewMailerTest < ActionMailer::TestCase
  test "art_new_mailer" do
    mail = ArtNewMailer.art_new_mailer
    assert_equal "Art new mailer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
