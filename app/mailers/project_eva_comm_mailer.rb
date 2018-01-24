class ProjectEvaCommMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(eva_comm_proj)
    @eva_comm_proj = eva_comm_proj
    @project = Project.find(@eva_comm_proj.project_id.to_i)
    @user = User.find(@project.user_id.to_i)
    mail(to: @user.email , subject: 'Postgrado - Asignación de comisión evaluadora')
  end

end
