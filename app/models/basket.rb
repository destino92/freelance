class Basket < ApplicationRecord
    has_many :basket_items, dependent: :destroy
    has_one :user

    def add_gig(gig)
        current_item = basket_items.find_by(gig_id: gig.id)

        if current_item
            current_item.increment(:quantity)
        else
            current_item = basket_items.build(gig_id: gig.id)
        end
        current_item
    end

    def total_price
        basket_items.to_a.sum { |item| item.total_price }
    end
end
