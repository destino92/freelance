class Negotiation < ApplicationRecord
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User'
  belongs_to :gig
  has_many :negotiation_offers

  enum status: {
    pending: "pending",
    accepted: "accepted",
    rejected: "rejected"
  }

end
