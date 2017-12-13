Rails.application.routes.draw do

  get "static_pages/about"
  get "/signup",      to: "users#new"
  post "/signup",     to: "users#create"
  get "/about",       to: "static_pages#about"
  get    "/login",    to: "sessions#new"
  post    "/login",   to: "sessions#create"
  delete  "/logout",  to: "sessions#destroy"
  resources :products, only: [:index, :show]
  resources :users
  namespace :admin do
    root "admin#index"
    resources :users, only: [:index, :delete]
    resources :products, except: [:index, :show]
    resources :categories
  end

  root "static_pages#home"
end
