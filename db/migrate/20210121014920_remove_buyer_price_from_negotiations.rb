class RemoveBuyerPriceFromNegotiations < ActiveRecord::Migration[6.0]
  def change
    remove_column :negotiations, :buyer_price, :integer
  end
end
