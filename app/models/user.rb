class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :recoverable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :validatable, :sms_confirmable

         validates :full_name, presence: true, length: {maximum: 50}

         has_one_attached :avatar

         has_many :gigs
         has_many :requests
         has_many :buying_orders, foreign_key: "buyer_id", class_name: "Order"
         has_many :selling_orders, foreign_key: "seller_id", class_name: "Order"
         has_many :offers
         #has_many :seller_negotiations, class_name: 'seller_id', foreign_key: 'Negotiation'
         #has_many :buyer_negotiations, class_name: 'buyer_id', foreign_key: 'Negotiation'


        def self.new_with_session(params, session)
            super.tap do |user|
                if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
                    user.email = data["email"] if user.email.blank?
                end
            end
        end

        def self.from_omniauth(auth)
            user = User.where(email: auth.info.email).first

            if user
                return user
            else
                where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
                    user.email = auth.info.email
                    user.password = Devise.friendly_token[0,20]
                    user.full_name = auth.info.name   # assuming the user model has a name
                    user.image = auth.info.image # assuming the user model has an image
                    user.uid = auth.uid
                    user.provider = auth.provider
                end
            end
        end


#   def self.from_omniauth(auth)
#     user = User.where(email: auth.info.email).first

#     if user
#       return user
#     else
#   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
#     user.email = auth.info.email
#     user.password = Devise.friendly_token[0, 20]
#     user.full_name = auth.info.name   # assuming the user model has a name
#     user.image = auth.info.image # assuming the user model has an image
  

#     user.uid = auth.uid
#     user.provider = auth.provider
#    end
#   end
# end

end
