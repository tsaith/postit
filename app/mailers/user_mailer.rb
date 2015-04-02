class UserMailer < ActionMailer::Base
  default from: ENV['POSTIT_SMTP_USER_NAME']

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "You have sucessfully registered.")
  end

end
