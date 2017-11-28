class UserMailer < ApplicationMailer
  default from: 'ceciliakhwong@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Weclome to Mr Manager!')
  end
end
