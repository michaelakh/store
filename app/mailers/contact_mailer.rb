class ContactMailer < ApplicationMailer
  def send_question_email(user, subject, question)
    @user = user
    @subject = subject
    @question = question
    mail to: 'michael_ak@hotmail.co.uk', subject: @subject
  end
end
