class SubjectResultMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(sub_per_users)
    @sub_per_users = sub_per_users
    @user = @sub_per_users.user
    @subject = @sub_per_users.coh_per_sub_us.subject_user.subject
    mail(to: @user.email , subject: 'Postgrado - Nuevas Notas disponibles')
  end

end
