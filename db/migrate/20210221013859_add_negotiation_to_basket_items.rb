class AddNegotiationToBasketItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :basket_items, :negotiation, foreign_key: true
  end
end
