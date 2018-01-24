# Preview all emails at http://localhost:3000/rails/mailers/ready_certificate_mailer
class ReadyCertificateMailerPreview < ActionMailer::Preview
  ReadyCertificateMailer.sample_email(Certificate.first)
end
