class UserMailer < ActionMailer::Base
  default from: ENV['POSTIT_SMTP_USER_NAME']

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "You have sucessfully registered.")
  end

  def new_post(user, post)
    @user = user
    @post = post
    mail(to: @user.email, subject: "There is a new post")
  end


end
