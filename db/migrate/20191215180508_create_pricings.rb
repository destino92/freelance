class CreatePricings < ActiveRecord::Migration[6.0]
  def change
    create_table :pricings do |t|
      t.string :title
      t.text :description
      t.integer :delivery_time
      t.integer :price
      t.integer :pricing_type
      t.references :gig, null: false, foreign_key: true

      t.timestamps
    end
  end
end
