class RemoveSellerPriceFromNegotiations < ActiveRecord::Migration[6.0]
  def change
    remove_column :negotiations, :seller_price, :integer
  end
end
