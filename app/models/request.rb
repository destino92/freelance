class Request < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one_attached :attachment_file
  has_many :offers, dependent: :delete_all
  has_many :orders

  validates :title, presence: {message: "Ne peut pas être vide"}
  validates :description, presence: {message: "Ne peut pas être vide"}
  validates :delivery, numericality: {only_integer: true, message:  "Doit être un chiffre"}


end
