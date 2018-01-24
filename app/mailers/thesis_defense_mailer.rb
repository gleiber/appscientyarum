class ThesisDefenseMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(defending_thesis)
    @defending_thesis = defending_thesis
    @thesis = @defending_thesis.thesis
    @user = @thesis.user
    @program_desc = @user.cohort_program.program.descripcion
    mail(to: @user.email , subject: 'Postgrado - Defensa de la tesis')
  end

end
