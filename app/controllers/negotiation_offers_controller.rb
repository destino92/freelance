class NegotiationOffersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @negotiation_offer = NegotiationOffer.new(negotiation_offer_params)
    @negotiation = Negotiation.find(negotiation_offer_params[:negotiation_id])

    if @negotiation_offer.save
        flash[:notice] = 'Sauvegardé...'
        render @negotiation_offer
    else
        flash[:alert] = "Impossible de répondre"
    end
  end

  private
  def negotiation_offer_params
    params.require(:negotiation_offer).permit(:user_id, :price, :negotiation_id)
  end

end
