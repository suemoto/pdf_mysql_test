class ArticleMailer < ApplicationMailer
  default from: 'n.s.bdash@gmail.com'

  def art_new_mailer(title, description, user)
    @title = title
    @description = description
    @user = user

    mail(
      subject: "新規記事を作成しました", #メールのタイトル
      to: @user.email #宛先
    ) do |format|
      format.text
    end
end
