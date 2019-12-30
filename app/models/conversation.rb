class Conversation < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  def last_message
    message = Message.where(conversation_id: self.id).last
    if message.present?
      return message
    else
      return Message.new updated_at: Time.now
    end
  end
end
