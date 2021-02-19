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
    
    if @negotiation.save
        @negotiation_offer = NegotiationOffer.create(user_id: current_user.id, price: @negotiation.price, negotiation_id: @negotiation.id)
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
    @negotiation_offers = @negotiation.negotiation_offers.order("created_at DESC")
    @negotiation_offer = NegotiationOffer.new
  end

  def accept
    @negotiation = Negotiation.find(element.dataset[:id].to_i)
    @negotiation.update(status: "accepted")

    # if current_user.id == @negotiation.seller_id
        # redirect_to negotiations_path
    # else
        # create new basket_item(@negotiation.gig_id)
        # redirect_to basket
  end

  def reject
    @negotiation = Negotiation.find(element.dataset[:id].to_i)
    @negotiation.update(status: "rejected")  
        
    #redirect_to negotiations_path
  end


  private

  def negotiation_params
    params.require(:negotiation).permit(:negotiation_id, :seller_id, :price, :status)
  end
end
