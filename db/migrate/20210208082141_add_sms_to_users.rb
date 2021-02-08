# frozen_string_literal: true

class AddSmsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone, :string, null: false, default: ""
    add_column :users, :sms_confirmation_token, :string  
    add_column :users, :sms_confirmed_at, :datetime
    add_column :users, :sms_confirmation_sent_at, :datetime
  end
end