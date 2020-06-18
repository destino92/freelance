class RemoveHasSinglePricingFromGigs < ActiveRecord::Migration[6.0]
  def change
    remove_column :gigs, :has_single_pricing, :boolean
  end
end
