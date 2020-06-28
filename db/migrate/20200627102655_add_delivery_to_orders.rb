class AddDeliveryToOrders < ActiveRecord::Migration[6.0]
    def up
        execute <<-SQL
            CREATE TYPE order_delivery_method AS ENUM ('retrait', 'livraison');
        SQL
        add_column :orders, :delivery, :order_delivery_method
        add_index :orders, :delivery
    end

    def down
        remove_column :orders, :delivery
        execute <<-SQL
            DROP TYPE order_delivery_method;
        SQL
    end
end
