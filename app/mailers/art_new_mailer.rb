class ArtNewMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.art_new_mailer.art_new_mailer.subject
  #
  # def art_new_mailer
  #   @greeting = "Hi"

  #   mail to: "to@example.org"
  # end
  def art_new_mailer(article,user)
    @article = article
    @user = user
    mail to:      user.email,
         subject: '会員情報が更新されました。'
  end
end
