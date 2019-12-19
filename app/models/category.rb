class Category < ApplicationRecord
  has_many :gigs
  has_many :requests
end
