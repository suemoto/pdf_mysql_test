# Preview all emails at http://localhost:3000/rails/mailers/art_new_mailer
class ArtNewMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/art_new_mailer/art_new_mailer
  def art_new_mailer
    ArtNewMailer.art_new_mailer
  end

end
