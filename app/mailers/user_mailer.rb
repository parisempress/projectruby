
class UserMailer < ApplicationMailer
  default from: "rochlaw36@outlook.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'rochlaw36@outlook.com',
        :subject => "A new contact form message from #{name}")
  end
end