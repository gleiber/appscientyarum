class AssignedProfessorMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(coh_per_sub_u)
    @coh_per_sub_u = coh_per_sub_u
    @subject = @coh_per_sub_u.subject_user.subject
    @user = @coh_per_sub_u.subject_user.user

    @period = @coh_per_sub_u.cohort_period.period
    @cohort = @coh_per_sub_u.cohort_period.cohort_program.cohort

    mail(to: @user.email , subject: 'Postgrado - Asignación de recursos a oferta')
  end


end
