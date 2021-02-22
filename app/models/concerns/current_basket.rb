module CurrentBasket

    private

    def set_basket
        if User.current.present?
            @basket = User.Current.basket
        else
            @basket = Basket.find(session[:basket_id])
            rescue ActiveRecord::RecordNotFound
            @basket = Basket.create
            session[:basket_id] = @basket.id
        end
        
    end
end