class AddStatusToNegotiations < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE negotiation_statuses AS ENUM ('pending', 'accepted', 'rejected');
      ALTER TABLE negotiations ADD status negotiation_statuses;
    SQL
  end

  def down
    remove_column :negotiations, :status
    execute <<-SQL
      DROP TYPE negotiation_statuses CASCADE;
    SQL
  end
end
