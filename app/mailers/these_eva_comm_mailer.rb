class TheseEvaCommMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(eva_comm_these)
    @eva_comm_these = eva_comm_these
    @these = Thesis.find(@eva_comm_these.thesis.id.to_i)
    @user = User.find(@these.user_id.to_i)
    mail(to: @user.email , subject: 'Postgrado - Asignación de comisión evaluadora')
  end
end
