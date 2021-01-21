class NegotiationOffer < ApplicationRecord
  belongs_to :user
  belongs_to :negotiation
end
