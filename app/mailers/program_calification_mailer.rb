class ProgramCalificationMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(programCalification)
    @program_calification = programCalification
    @user = User.find(@program_calification.user_id)
    @program = Program.find(@program_calification.program_id)

    mail(to: @user.email , subject: 'Postgrado - ¡Comentanos tu experiencia con nosotros!')
  end
end
