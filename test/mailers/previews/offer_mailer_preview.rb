# Preview all emails at http://localhost:3000/rails/mailers/offer_mailer
class OfferMailerPreview < ActionMailer::Preview
  def offer_mail_preview
    OfferMailer.sample_email(User.first,Program.where(:id=>1).pluck(:titulo))
  end



end
