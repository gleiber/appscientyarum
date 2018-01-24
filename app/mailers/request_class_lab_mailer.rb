class RequestClassLabMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(request)
    @request = request
    @user = request.defending_thesis.thesis.user
    @event = request.event
    mail(to: @user.email , subject: 'Postgrado - Información de asignación de salón para defensa')
  end
end
