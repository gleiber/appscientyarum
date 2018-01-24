# Preview all emails at http://localhost:3000/rails/mailers/these_eva_comm_mailer
class TheseEvaCommMailerPreview < ActionMailer::Preview
  TheseEvaCommMailer.sample_email(EvaCommThesis.first).deliver_now
end
