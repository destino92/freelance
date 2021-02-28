class AddBasketToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :basket, foreign_key: true
  end
end
