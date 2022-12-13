Rails.application.routes.draw do
  devise_for :users do
    resources :wishlists, only: [:create]
  end

  root to: "pages#home"

  resources :exchanges, only: [:show, :update] do
    resources :messages, only: :create
  end

  resources :vinyls, only: [:index, :show] do
    # resources :exchanges, only: [:index]
    # resources :collections_vinyls, only: [:create, :new] # Ceci sont les anciennes routes, il faudrait prendre ceux de users_vinyls à la place
    resources :users_vinyls, only: [:create, :new, :update]
  end

  resources :collections, only: [:new, :create, :show, :index]

  resources :collections_vinyls, only: [:destroy]

  resources :users_vinyls, only: [] do
    resources :exchanges, only: [:new, :create]
  end

  resources :wishlists, only: [:destroy]

  get "my-exchanges", to: "exchanges#index"
  patch "exchanges/:id/status", to: "exchanges#update_status"
  patch "exchanges/:id/offered_vinyl", to: "exchanges#update_offered_vinyl"
  get "vinyls-to-exchange", to: "collections#vinyls_to_exchange"
end
