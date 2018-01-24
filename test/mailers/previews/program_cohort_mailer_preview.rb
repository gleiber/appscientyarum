# Preview all emails at http://localhost:3000/rails/mailers/program_cohort_mailer
class ProgramCohortMailerPreview < ActionMailer::Preview

ProgramCohortMailer.sample_email(User.first,Program.first,Postulate.first).deliver_now

end
