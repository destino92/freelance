Trestle.resource(:gigs) do
  remove_action :new
  remove_action :destroy

  menu do
    item :gigs, icon: "fa fa-address-card"
  end

table do
    column :title
    column :active
    column :user, -> (obj) { obj.user.full_name}
    column :created_at, align: :center
    actions do |toolbar, instance, admin|
      toolbar.link 'Activate', admin.path(:activate, id: instance.id), method: :post, class: 'btn btn-success'
      toolbar.link 'Deactivate', admin.path(:deactivate, id: instance.id), method: :post, class: 'btn btn-danger'
    end
  end

  controller do 
    def activate
  gig = admin.find_instance(params)
 gig.update(active: true)

      flash[:message] = "Gig is activated"
      redirect_to admin.path(:show, id: gig)
    end

      def deactivate
 gig = admin.find_instance(params)
gig.update(active: false)

      flash[:message] = "Gig is deactivated"
      redirect_to admin.path(:show, id: gig)
    end
  end

  routes do 
    post :activate, on: :member
    post :deactivate, on: :member
  end

  form do |gig|
    text_field :title
    editor :description
    select :category_id, Category.where(active: true)
  end

  search do |query|
    if query
      Gig.where("title ILIKE ?", "%#{query}%")
    else
 Gig.all 
    end
  end

end

