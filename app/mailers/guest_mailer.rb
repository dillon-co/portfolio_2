class GuestMailer < ApplicationMailer
  def send_visitor_mailer(user, message)
    @messgae = message
    mail(to: user.email, subject:'A Message Yourself :)', body: message)
  end  
end
