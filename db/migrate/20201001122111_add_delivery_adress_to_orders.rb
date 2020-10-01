class AddDeliveryAdressToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :address, :string
  end
end
