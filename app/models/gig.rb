class Gig < ApplicationRecord
  include AlgoliaSearch
  include Rails.application.routes.url_helpers

  before_destroy :not_referenced_by_any_basket_item
  belongs_to :user
  belongs_to :category

  has_many :basket_items
  has_many :orders
  has_many :reviews
  has_many :negotiations
  has_many_attached :photos
  has_rich_text :description

  validates :title, presence: {message: 'Ne peut pas etre vide'}
  validates :price, presence: {message: 'Ne peut pas etre vide'}

  algoliasearch per_environment: true do
    attribute :title, :description, :price, :created_at, :created_at_i

    attribute :category do
      category.name
    end

    attribute :user do
      user.full_name
    end

    attribute :average_rating do
        reviews.count == 0 ? 0 : reviews.average(:stars).round(1)
    end

    attribute :created_at_i do
      created_at.to_i
    end

    attribute :photo do
      photos.first.service_url
    end

    attribute :url

    searchableAttributes ['unordered(title)', 'unordered(description)', 'unordered(user)','unordered(category)']

    customRanking ['desc(avg_rating)']

    attributesForFaceting ['searchable(category)']
  end

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:stars).round(1)
  end

  def url
    gig_path(self)
  end



  private

   def not_referenced_by_any_basket_item
    unless basket_items.empty?
      errors.add(:base, 'basket items present')
      throw :abort
    end
   end
end
