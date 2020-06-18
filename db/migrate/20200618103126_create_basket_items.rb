class CreateBasketItems < ActiveRecord::Migration[6.0]
  def change
    create_table :basket_items do |t|
      t.references :gig, foreign_key: true
      t.belongs_to :basket, foreign_key: true

      t.timestamps
    end
  end
end
