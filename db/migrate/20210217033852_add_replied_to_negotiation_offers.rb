class AddRepliedToNegotiationOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :negotiation_offers, :replied, :boolean, default: false
  end
end
