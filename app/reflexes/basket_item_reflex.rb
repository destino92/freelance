# frozen_string_literal: true

class BasketItemReflex < ApplicationReflex
  def incrementQuantity
    @basket_item = BasketItem.find(element.dataset[:id])
    newQuantity = @basket_item.quantity + element.value
    @basket_item.update(quantity: newQuantity)
  end
end
