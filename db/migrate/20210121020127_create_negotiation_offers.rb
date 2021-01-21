class CreateNegotiationOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :negotiation_offers do |t|
      t.references :user, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
