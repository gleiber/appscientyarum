class UserMailer < ApplicationMailer

  def new_user(user)
    @user = user
    mail(to: user.email, subject: "Su cuenta ha sido creada!")
  end
end
