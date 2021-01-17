class AddGigToNegotiations < ActiveRecord::Migration[6.0]
  def change
    add_reference :negotiations, :gig, foreign_key: true
  end
end
