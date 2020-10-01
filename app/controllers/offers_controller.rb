class OffersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_offer, only: [:accept, :reject]
  before_action :is_authorized, only: [:accept, :reject]

  def create
    req = Request.find(offer_params[:request_id])

    if req && req.user_id == current_user.id
      redirect_to request.referrer, alert: "Vous ne pouvez pas faire une offre sur votre propre demande"
      return
end
   
   if Offer.exists?(user_id: current_user.id, request_id: offer_params[:request_id])
    redirect_to request.referrer, alert: "Vous ne pouvez faire q'une offre pour l'instant"
    return
end

  @offer = current_user.offers.build(offer_params)
  if @offer.save
    redirect_to(my_offers_path)
    return
  else
    redirect_to request.referrer, flash: {error: @offer.errors.full_messages.join(', ')}
  end
end



  def accept
    if @offer.pending?
      @offer.accepted!

      if charge(@offer.request, @offer)
      flash[:notice] = "Accepted"
      return redirect_to buying_orders_path
    else
      flash[:alert] = "Impossible de créer votre commande"
    end
  end
    redirect_to request.referrer
  end


  def reject
     if @offer.pending?
       @offer.rejected!
       flash[:notice] = "Rejected"
    end
    redirect_to request.referrer
  end


  private

  def charge(req, offer)
    order = req.orders.new
    order.due_date = Date.today() + offer.days
    order.title = req.title
    order.seller_name = offer.user.full_name
    order.seller_id = offer.user.id
     order.buyer_name = current_user.full_name
    order.buyer_id = current_user.id
    order.amount = offer.amount
    order.save
    end

  def set_offer
    @offer = Offer.find(params[:id])
  end


  def is_authorized
    redirect_to root_path, alert: "You dont't have permission" unless current_user.id == @offer.request.user_id    
    end

    def offer_params
      params.require(:offer).permit(:amount, :days, :note, :request_id, :status)
    end

end