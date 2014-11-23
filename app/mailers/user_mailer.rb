class UserMailer < ActionMailer::Base
  default from: "clinic.bulletin@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: "You have successfully registered.")
  end


end
