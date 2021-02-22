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
    @negotiation = Negotiation.find(params[:id])
    @negotiation.update(status: "accepted")

    if current_user.id == @negotiation.seller_id
        redirect_to negotiations_path
    else        
        #Figure this shit out

        @gig = @negotiation.gig
        @basket_item = @basket.add_gig(@gig)
        @basket_item.negotiation_id = @negotiation.id
        @basket_item.save
        redirect_to @basket_item.basket, notice: 'Successfully added to basket.' 

        # create new basket_item(@negotiation.gig_id)
        #@basket_item = @basket.add_gig(@gig)
        #redirect_to basket_items_path(gig_id: @negotiation.gig)
        
        # redirect_to basket
        #respond_to do |format|
        #    if @basket_item.save
        #        format.html { redirect_to @basket_item.basket, notice: 'Successfully added to basket.' }
        #    end
        #end
    end
  end

  def reject
    @negotiation = Negotiation.find(params[:id])
    @negotiation.update(status: "rejected")  
    
    flash[:notice] = 'Négotiation rejetté'
    redirect_to negotiations_path
  end


  private

  def negotiation_params
    params.require(:negotiation).permit(:gig_id, :negotiation_id, :seller_id, :price, :status)
  end
end
