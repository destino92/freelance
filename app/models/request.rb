class Request < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one_attached :attachment_file
  has_many :offers, dependent: :delete_all
  has_many :orders

  validates :title, presence: {message: "cannot be empty"}
  validates :description, presence: {message: "cannot be empty"}
  validates :delivery, numericality: {only_integer: true, message:  "must be a number"}


end
