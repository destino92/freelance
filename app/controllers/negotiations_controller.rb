class NegotiationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @negotiations = Negotiation.where("seller_id = ? OR buyer_id = ?", current_user.id, current_user.id)
                     .order(updated_at: :desc)
  end

  def create
    @negotiation = Negotiation.new(negotiation_params)
    @negotiation.buyer_id = current_user.id
    @negotiation.status = 'pending'

    @negotiation_offer = NegotiationOffer.create(user_id: current_user.id, price: @negotiation.price)
    
    
    if @negotiation.save
        flash[:notice] = 'Sauvegardé...'
        redirect_to negotiations_path        
    else
        flash[:alert] = "Impossible de négotier"
    end

  end

  def update
  end

  def show
    @negotiation = Negotiation.find(params[:id])
    @negotiation_offers = @negotiation.negotiation_offers
  end

  private

  def negotiation_params
    params.require(:negotiation).permit(:gig_id, :seller_id, :price)
  end
end
