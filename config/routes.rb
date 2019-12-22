Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'users/dashboard'
  get '/dashboard', to: 'users#dashboard'
  get '/users/:id', to: 'users#show'
  get '/selling_orders', to: 'orders#selling_orders'
   get '/buying_orders', to: 'orders#buying_orders'
   get '/all_requests', to: 'requests#list'
   get '/request_offers/:id', to: 'requests#offers', as: 'request_offers'
    get '/my_offers', to: 'requests#my_offers'

  post 'users/edit', to: 'users#update'
  post '/offers', to: 'offers#create'
  post'/reviews', to: 'reviews#create'

  put '/orders/:id/complete', to: 'orders#complete', as: 'complete_order'
  put '/offers/:id/accept', to: 'offers#accept', as: 'accept_offer'
   put '/offers/:id/reject', to: 'offers#reject', as: 'reject_offer'

  

  resources :gigs do 
    member do
      delete :delete_photo
      post :upload_photo
    end
    resources :orders, only: [:create]
  end
  resources :requests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
