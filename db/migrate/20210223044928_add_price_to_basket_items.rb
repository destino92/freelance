class AddPriceToBasketItems < ActiveRecord::Migration[6.0]
  def change
    add_column :basket_items, :price, :integer, null: false
  end
end
