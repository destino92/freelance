class Order < ApplicationRecord
    belongs_to :gig, required: false
    belongs_to :requests, required: false
    belongs_to :buyer, class_name: "User"
    belongs_to :seller, class_name: "User"
    enum status: [:published, :unpublished, :not_set]
    enum delivery: { retrait: "retrait", livraison: "livraison" }, _prefix: :delivery_type
    enum payment: { mtn: "mtn", airtel: "airtel" }, _prefix: :payment

    has_many :reviews

    enum status: [:inprogress, :confirmed, :completed]
end
