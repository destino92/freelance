class CreateNegotiations < ActiveRecord::Migration[6.0]
  def change
    create_table :negotiations do |t|
      t.references :seller
      t.references :buyer
      t.integer :seller_price
      t.integer :buyer_price

      t.timestamps
    end
  end
end
