class AddPaypalToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :paypal, :string
  end
end
