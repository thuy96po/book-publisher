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
  resources :users
  resources :books do
    resources :comments
  end
end
