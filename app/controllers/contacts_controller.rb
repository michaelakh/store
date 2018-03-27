class ContactsController < ApplicationController
  def contact
    @user = User.where(email:params[:email])
  end
  
  def send_email
    @user_info = User.where(email:params[:email]).first
    
    if @user_info.nil?
      @user = "#{params[:email]} (Does not have an account)"
    else
      @user = "#{@user_info.first_name} #{@user_info.last_name} | #{params[:email]} (Has an account at nucifera.co.uk) "
    end
    
    @subject = params[:category]
    @question = params[:question]
    
     respond_to do |format|
      if ContactMailer.send_question_email(@user, @subject, @question).deliver
        flash[:success] = 'Your message has been send'
        format.html { redirect_to email_confirm_path}
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def email_confirm
  end
  
end
