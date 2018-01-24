class ReadyCertificateMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(certificate)
    @certificate = certificate
    @user = User.find(@certificate.user_id)
    mail(to: @user.email , subject: 'Postgrado - Información de Constancia solicitada')
  end

end
