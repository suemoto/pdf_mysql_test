class ArticleMailer < ApplicationMailer
  default from: ENV['MAILER_ADDRESS']

  def art_new_mailer(myfile,user)
    @myfile = myfile
    @user = user

    mail to: user.email,  #宛先
         subject: '新規記事を作成しました' #メールのタイトル
  end
end
