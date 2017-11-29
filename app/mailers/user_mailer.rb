class UserMailer < ApplicationMailer
  default from: 'mrmanager247@gmail.com'

  def new_member_email(user_email)
    @user_email = user_email
    @url = 'http://localhost:3000/'
    mail(to: @user_email, subject: 'Welcome to Mr Manager!')
  end
end
