Rails.application.routes.draw do
  get 'users/dashboard'
  get '/dashboard', to: 'users#dashboard'

  post 'users/edit', to: 'users#update'
  devise_for :users
  root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
