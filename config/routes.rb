Rails.application.routes.draw do
  root "home#index"
  get "/branch", to: "static_pages#branch"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/addition/:id", to: "books#addition", as: "addition"
  get "carts", to: "carts#show"
  delete "carts", to: "carts#destroy_all", as: "destroy_carts_all"
  delete "carts/:id", to: "carts#destroy", as: "destroy"
  post "carts", to: "carts#edit"
  get "bills", to: "bills#new"
  post "bills", to: "bills#create"
  resources :users
  resources :books do
    resources :comments
  end
end
