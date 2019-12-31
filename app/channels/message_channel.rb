class MessageChannel < ApplicationCable::Channel
  def subscribed
    conversation = Conversation.find params[:conversation]
    stream_from conversation
  end

end
