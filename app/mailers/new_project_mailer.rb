class NewProjectMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(project)
    @user = User.find(project.user_id.to_i)
    @project = project
    mail(to: @user.email , subject: 'Postgrado - Registro de Proyecto')
  end

end
