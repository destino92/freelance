# frozen_string_literal: true

class BasketItemReflex < ApplicationReflex
  def incrementQuantity
    @basket_item = BasketItem.find(element.dataset[:id])
    @basket_item.update(quantity: element.value.to_i)
  end
end
