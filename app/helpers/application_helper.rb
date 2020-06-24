module ApplicationHelper


    def avatar_url(user)
        if user.avatar.attached?
            url_for(user.avatar)
        else
            ActionController::Base.helpers.asset_path('icon_default_avatar.png')
        end 
    end

    def gig_cover(gig)
        if gig.photos.attached?
            url_for(gig.photos[0])
        else
            ActionController::Base.helpers.asset_path('icon_default_image.png')
        end
    end

    def basket_count_over_one
        if @basket.basket_items.count > 0
            return "<span class='tag is-warning'>#{@basket.basket_items.count}</span>".html_safe
        end
    end

    def basket_has_items
        return @basket.basket_items.count > 0
    end
end