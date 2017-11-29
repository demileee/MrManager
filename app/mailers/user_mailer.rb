class UserMailer < ApplicationMailer
  default from: 'Mr Manager'

  def new_member_email(user_email, project_title, name_of_inviter)
    @user_email = user_email
    @project_title = project_title
    @name_of_inviter = name_of_inviter
    @url = 'http://localhost:3000/'
    mail(to: @user_email, subject: 'Invitation to Join Mr Manager!')
  end
end
