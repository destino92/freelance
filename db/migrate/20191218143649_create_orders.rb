class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.date :due_date
      t.string :title
      t.float :amount
      t.integer :status, default: 0
      t.string :seller_name
      t.string :buyer_name
      t.references :gig, null: true, foreign_key: true
      t.references :buyer, foreign_key: {to_table: :users}
      t.references :seller, foreign_key:  {to_table: :users}

      t.timestamps
    end
  end
end
