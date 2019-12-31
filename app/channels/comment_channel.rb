class CommentChannel < ApplicationCable::Channel
  def subscribed
    order = Order.find params[:ORDER]
    stream_from "order"
  end

end
