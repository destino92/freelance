class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :status
      t.integer :transaction_type
      t.float :amount
      t.integer :source_type
      t.references :request, foreign_key: true
      t.references :gig, foreign_key: true
      t.references :buyer, foreign_key: { to_table: :users }
      t.references :seller, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
