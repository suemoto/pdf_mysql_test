class ApplicationMailer < ActionMailer::Base
  default from: 'jungle事務局'
  layout 'article_mailer_mailer/art_new_mailer'


  # default from:     "メールテスト運営局",
  #         bcc:      "sample+sent@gmail.com",
  #         reply_to: "sample+reply@gmail.com"
  # layout 'mailer'
end
