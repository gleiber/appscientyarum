class NewThesesMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(these)
    @these = these
    @user = User.find(@these.user_id.to_i)
    mail(to: @user.email , subject: 'Postgrado - Registro de Tesis')
  end
end
