class NegotiationsController < ApplicationController
  def index
  end

  def create
    @negotiation = Negotiation.new(negotiation_params)
    @negotion
    
    if @negotiation.save
        flash[:notice] = 'Sauvegardé...'
    else
        flash[:alert] = "Impossible de négotier"
    end

  end

  def update
  end

  def show
  end

  private

  def negotiation_params
    params.require(:negotiation).permit(:seller_price, :buyer_price, :gig_id, :seller_price, :buyer_id, :seller_id)
  end
end
