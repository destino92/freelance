class BasketItem < ApplicationRecord
  #validates :quantity, numericality: { :less_than_or_equal_to => gig.stock }

  belongs_to :gig
  belongs_to :basket

  def total_price
    self.price.to_i * quantity.to_i
  end
end
