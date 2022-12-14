Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:create, :index, :update, :destroy, :show] do
    resources :artwork_shares, only: [:index]
    resources :artworks, only: [:index]
  end
  resources :artworks, only: [:index, :create, :update, :destroy, :show]
  resources :artwork_shares, only: [:index, :create, :destroy]

  # get "/users", to: "users#index"
  # post "/users", to: "users#create"
end
