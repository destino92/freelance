class AddPayementToOrders < ActiveRecord::Migration[6.0]
    def up
        execute <<-SQL
            CREATE TYPE order_payment_method AS ENUM ('mtn', 'airtel');
        SQL
        add_column :orders, :payment, :order_payment_method
        add_index :orders, :payment
    end

    def down
            remove_column :orders, :payment
        execute <<-SQL
            DROP TYPE order_payment_method;
        SQL
    end
end
