class NewPollMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(poll,user)
    @poll = poll
    @user = user

    mail(to: @user.email , subject: 'Postgrado - ¡Postgrado necesita un minuto de tu tiempo!')
  end

end
