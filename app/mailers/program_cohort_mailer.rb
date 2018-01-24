class ProgramCohortMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(user,program,postulate)
    @user = user
    @program = program
    @postulate = postulate
    mail(to: @user.email , subject: 'Postgrado - Información de Programa abierto')
  end
end
