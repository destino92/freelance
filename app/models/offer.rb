class Offer < ApplicationRecord
  belongs_to :request
  belongs_to :user
  enum status: [:pending, :accepted, :rejected]
  validates :amount, :days, numericality: { only_integer: true, message: "Doit etre un chiffre"}
end
