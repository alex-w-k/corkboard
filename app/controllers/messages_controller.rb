class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.content,
        user: message.user.full_name,
        created_at: message.created_at.strftime("%H:%M")
    else
      redirect_to bids_path
    end
  end

  def index
  end

  private

  def message_params
    params.require(:message).permit(:content, :bid_id)
  end

end
