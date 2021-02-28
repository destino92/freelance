module CurrentBasket

    private

    def set_basket
        if User.current.present?
            session_basket = @basket
            @basket = Basket.find(User.current.basket_id)

            unless @basket
                @basket = Basket.create!
                User.current.basket_id = @basket.id
                session_basket.destroy!
            end

            if(session_basket && session_basket.basket_items.count > 0)
                @basket.basket_items << session_basket.basket_items
                session_basket.destroy!
            end

            @basket
        else
            begin
                @basket = Basket.find(session[:basket_id])
            rescue ActiveRecord::RecordNotFound
                @basket = Basket.create
                session[:basket_id] = @basket.id
            end
        end
    end
end