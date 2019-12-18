class Order < ApplicationRecord
  belongs_to :gig, required: false
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"

  enum status: [:inprogress, :completed]
end
