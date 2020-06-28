class AddCodeToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :code, :string
  end
end
