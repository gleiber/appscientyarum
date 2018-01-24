class CommAsignationMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(user,project,descrip)
    @user = user
    @project = project
    @rango = descrip
    mail(to: @user.email , subject: 'Postgrado - Registro en Comision Evaluadora')
  end

end
