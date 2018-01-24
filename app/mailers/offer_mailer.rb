class OfferMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(user,descrip)
    @user = user
    @program_desc = descrip
    mail(to: @user.email , subject: 'Postgrado - Información de Oferta')
  end


end
