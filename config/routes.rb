Rails.application.routes.draw do
  resources :payments
  resources :orders
  resources :services
  resources :clients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
