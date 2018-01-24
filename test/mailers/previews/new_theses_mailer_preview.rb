# Preview all emails at http://localhost:3000/rails/mailers/new_theses_mailer
class NewThesesMailerPreview < ActionMailer::Preview
  NewThesesMailer.sample_email(Thesis.first).deliver_now
end
