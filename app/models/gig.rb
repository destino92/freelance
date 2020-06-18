class Gig < ApplicationRecord
  before_destroy :not_referenced_by_any_basket_item
  belongs_to :user
  belongs_to :category

  has_many :basket_items
  has_many :pricings
  has_many :orders
  has_many :reviews
  has_many_attached :photos
  has_rich_text :description

  accepts_nested_attributes_for :pricings

  validates :title, presence: {message: 'cannot be blank'}

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:stars).round(1)

  end

  private

   def not_referenced_by_any_basket_item
    unless basket_items.empty?
      errors.add(:base, 'basket items present')
      throw :abort
    end
   end
end
