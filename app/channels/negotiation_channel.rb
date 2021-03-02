class NegotiationChannel < ApplicationCable::Channel
  def subscribed
    stream_for User.find(params[:id])
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
