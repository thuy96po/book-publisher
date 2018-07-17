Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root "home#index"
  get "/branch", to: "static_pages#branch"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  post "/addition/:id", to: "books#addition", as: "addition"
  get "carts", to: "carts#show"
  delete "carts", to: "carts#destroy_all", as: "destroy_carts_all"
  delete "carts/:id", to: "carts#destroy", as: "destroy"
  post "carts", to: "carts#edit"
  get "bills", to: "bills#new"
  post "bills", to: "bills#create"
  get "my_bills", to: "bills#index"
  get "detail/:id", to: "bills#show", as: "detail"
  get "/profile", to: "users#show"
  post "/profile", to: "users#update"
  resources :books do
    resources :comments
  end
  namespace :admin do
    resources :book_discounts
    resources :bills
  end
end
