# Preview all emails at http://localhost:3000/rails/mailers/program_calification_mailer
class ProgramCalificationMailerPreview < ActionMailer::Preview
    ProgramCalificationMailer.sample_email(ProgramCalification.first).deliver_now
end
