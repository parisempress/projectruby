class ApplicationMailer < ActionMailer::Base
  default from: "rochlaw36@outlook.com"
  layout 'mailer'
end

def thank_you
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
  UserMailer.contact_form(@email, @name, @message).deliver_now
end