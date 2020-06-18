class BasketItem < ApplicationRecord
  belongs_to :gig
  belongs_to :basket

  def total_price
    gig.price.to_i * quantity.to_i
  end
end
