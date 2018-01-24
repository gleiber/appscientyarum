class ThesesReviewMailer < ApplicationMailer
  default from: "postgradodcyt@gmail.com"

  def sample_email(review)
    @review = review
    @these = review.thesis
    @user = User.find(@these.user_id)
    mail(to: @user.email , subject: 'Postgrado - Información de revisión')
  end
end
