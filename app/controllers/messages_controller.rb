class MessagesController < ApplicationController
  def create
    if current_user.id == message_params[:receiver_id]
      redirect_to request.referrer, alert: "You cannot send message to yourself"
    end

    conversation = Conversation.where("(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)",
                                      current_user.id, message_params[:receiver_id], 
                                      message_params[:receiver_id], current_user.id
                                    ).first
    if !conversation.present?
      conversation = Conversation.create(sender_id: current_user.id, receiver_id: message_params[:receiver_id])
    end

    @message = Message.new(user_id: current_user.id, 
                           conversation_id: conversation.id,
                           content: message_params[:content]
    )

    if @message.save
      conversation.update!(updated_at: @message.created_at)
      receiver = conversation.sender.id == current_user.id ? conversation.receiver : conversation.sender

      MessageChannel.broadcast_to conversation, 
                                  sender_id: current_user.id, 
                                  sender: render_message(@message, current_user),
                                  receiver: render_message(@message, receiver)

      if URI(request.referrer).path == conversation_detail_path(id: receiver.id)
        return render json: {success: true}
      end

      redirect_to request.referrer, notice: "Message sent..."
    else
      redirect_to request.referrer, alert: "Cannot send the message"
    end
  end

  private

  def render_message(message, user)
    self.render_to_string partial: 'conversations/message', locals: {m: message, user: user}
  end

  def message_params
    params.require(:message).permit(:content, :receiver_id)
  end
end
