class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :full_name, presence: true, length: {maximum: 50}

         has_one_attached :avatar

         has_many :gigs
        has_many :requests
         has_many :buying_orders, foreign_key: "buyer_id", class_name: "Order"
        has_many :selling_orders, foreign_key: "seller_id", class_name: "Order"

end
