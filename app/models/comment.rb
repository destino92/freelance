class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :order
  has_one_attached :attachment_file
end
