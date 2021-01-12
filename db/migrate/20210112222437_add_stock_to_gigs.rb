class AddStockToGigs < ActiveRecord::Migration[6.0]
  def change
    add_column :gigs, :stock, :integer
  end
end
