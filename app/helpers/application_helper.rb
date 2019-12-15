module ApplicationHelper


  def avatar_url(user)
    if user.avatar.attached?
      url_for(user.avatar)
    else
      ActionController::Base.helpers.asset_path('icon_default_avatar.png')
    end      

  end
end
