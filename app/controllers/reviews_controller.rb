class ReviewsController < ApplicationController
 def create
  order = Order.find(review_params[:order_id])

  if order && current_user.id == order.buyer.id
    if Review.exists?(order_id: review_params[:order_id], buyer_id: current_user.id)
      flash[:alert] ="Vous avez déjà laisser une revue"
    else
      review = Review.new(review_params)
      review.gig = order.gig
      review.buyer = current_user
      review.seller = order.seller

      if review.save
        flash[:notice] = 'Sauvegardé...'
      else
        flash[:alert] = "Impossible de laisser une revue"
      end
    end
  else
    flash[:alert] = "Commande invalide"
  end
  redirect_to request.referrer

end

private

def review_params

 params.require(:review).permit(:stars, :review, :order_id)

end

end