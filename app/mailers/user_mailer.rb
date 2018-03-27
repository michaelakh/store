class UserMailer < ApplicationMailer
  
  def sign_up_confirmation(user)
    @user = user
    @greeting = "hi"
    mail to: @user.email, subject: 'Welcome to My Awesome Site'
  end
end
