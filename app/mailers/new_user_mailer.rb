class NewUserMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email , subject: 'Postgrado - Creación de Usuario')
  end


end
