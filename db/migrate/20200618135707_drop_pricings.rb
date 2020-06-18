class DropPricings < ActiveRecord::Migration[6.0]
  def change
    drop_table :pricings
  end
end
