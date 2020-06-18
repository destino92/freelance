module CurrentBasket

    private

    def set_basket
        @basket = Basket.find(session[:basket_id])
    rescue ActiveRecord::RecordNotFound
        @basket = Basket.create
        session[:basket_id] = @basket.id
    end
end