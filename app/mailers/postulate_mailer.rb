class PostulateMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(postulate)
    @postulate = postulate
    @offer = Offer.find(postulate.offer_id)
    @program = Program.find(@offer.program_id)
    mail(to: @postulate.email , subject: 'Postgrado - Información de Postulacion')
  end
end
