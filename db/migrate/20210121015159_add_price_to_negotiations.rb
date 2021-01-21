class AddPriceToNegotiations < ActiveRecord::Migration[6.0]
  def change
    add_column :negotiations, :price, :integer
  end
end
