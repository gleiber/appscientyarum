# Preview all emails at http://localhost:3000/rails/mailers/project_eva_comm_mailer
class ProjectEvaCommMailerPreview < ActionMailer::Preview

  ProjectEvaCommMailer.sample_email(EvaCommProj.first)

end
