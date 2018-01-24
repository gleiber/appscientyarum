# Preview all emails at http://localhost:3000/rails/mailers/postulate_mailer
class PostulateMailerPreview < ActionMailer::Preview
  def postulate_mail_preview
    PostulateMailer.sample_email(Postulate.first)
  end

end
