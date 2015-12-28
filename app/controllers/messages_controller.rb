class MessagesController < ApplicationController

  def send_validation_message(message)
    api = Twilio::REST::Client.new(ENV['ACTIVITIES_ACCOUNT_SID'], ENV['ACTIVITIES_AUTH_TOKEN']) 
    api.messages.create(
      body: "Hey, #{message.name}! Thank's for your text! If you are looking for a developer 
      reply with 'dev needed' and I'll text you back from my personal cell. :)",
      to: message.number,
      from: "+15005550006"
    )  
  end 

  def new 
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
      send_validation_message(@message)
    else
      render :error
    end  
  end

  private

  def message_params
    params.require(:message).permit(:number, :name, :text_message)
  end

end
