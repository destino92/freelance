class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :review
      t.integer :stars, default: 1
      t.references :order, null: false, foreign_key: true, type: :uuid
      t.references :gig, null: true, foreign_key: true
       t.references :buyer, foreign_key: {to_table: :users}
      t.references :seller, foreign_key:  {to_table: :users}
      t.timestamps
    end
  end
end
