Trestle.resource(:categories) do
  menu do
    item :categories, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :name
    column :active
    column :created_at, align: :center
    actions do |toolbar, instance, admin|
      toolbar.link 'Activate', admin.path(:activate, id: instance.id), method: :post, class: 'btn btn-success'
      toolbar.link 'Deactivate', admin.path(:deactivate, id: instance.id), method: :post, class: 'btn btn-danger'
    end
  end

  controller do 
    def activate
      cat = admin.find_instance(params)
      cat.update(active: true)

      flash[:message] = "Category is activated"
      redirect_to admin.path(:show, id: cat)
    end

      def deactivate
      cat = admin.find_instance(params)
      cat.update(active: false)

      flash[:message] = "Category is deactivated"
      redirect_to admin.path(:show, id: cat)
    end
  end

  routes do 
    post :activate, on: :member
    post :deactivate, on: :member
  end

  form do |category|
    text_field :name
  end

  




  # Customize the form fields shown on the new/edit views.
  #
  # form do |category|
  #   text_field :name
  #
  #   row do
  #     col(xs: 6) { datetime_field :updated_at }
  #     col(xs: 6) { datetime_field :created_at }
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:category).permit(:name, ...)
  # end
end
