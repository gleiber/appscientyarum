class ThesisCommAsignationMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(user,thesis,descrip)
    @user = user
    @thesis = thesis
    @rango = descrip
    mail(to: @user.email , subject: 'Postgrado - Registro en Comision Evaluadora')
  end

end
