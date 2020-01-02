class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :plan_id
      t.string :sub_id
      t.integer :status, default: 0
      t.date :expired_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
