class AddNegotiationToNegotiationOffer < ActiveRecord::Migration[6.0]
  def change
    add_reference :negotiation_offers, :negotiation, foreign_key: true
  end
end
