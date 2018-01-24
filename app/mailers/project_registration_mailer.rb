class ProjectRegistrationMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(project)
    @project = project
    @user = project.user
    mail(to: @user.email , subject: 'Postgrado - Registro de Proyecto')
  end

end
