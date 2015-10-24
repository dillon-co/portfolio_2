class GuestMailersController < ApplicationController
  def new
  end
  
  def create
    mailer = GuestMailer.new(mailer_params)
    if mailer.save  
     send_visitor_mailer(mailer.email, mailer.message)
    else
      render :new
    end   
  end  

  private

  def mailer_params
    params.require(:guestmailer).permit(:email, :message)
  end  
end
