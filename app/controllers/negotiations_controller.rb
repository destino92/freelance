class NegotiationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @negotiations = Negotiation.where(seller_id == current_user.id || buyer_id == current_user.id)
  end

  def create
    @negotiation = Negotiation.new(negotiation_params)
    @negotiation.buyer_id = current_user.id
    
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
  end

  private

  def negotiation_params
    params.require(:negotiation).permit(:gig_id, :seller_id)
  end
end
