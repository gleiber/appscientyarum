class ProjectReviewMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(review)
    @review = review
    @project = review.project
    @user = User.find(@project.user_id)
    mail(to: @user.email , subject: 'Postgrado - Información de revisión')
  end

end
