class Negotiation < ApplicationRecord
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User'

  enum status: {
    pending: "pending",
    accepted: "accepted",
    published: "rejected"
  }

end
