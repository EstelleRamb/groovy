Rails.application.routes.draw do
  devise_for :users do
    resources :wishlists, only: [:create]
  end
  resources :exchanges, only: [:create]
  root to: "pages#home"
  resources :vinyls, only: [:index, :show] do
    resources :exchanges, only: [:index]
    resources :collections_vinyls, only: [:create, :new]
  end

  resources :collections, only: [:new, :create, :show, :index]

  resources :collections_vinyls, only: [:destroy]
  resources :wishlists, only: [:destroy]
  get "my-exchanges", to: "exchanges#index"
  patch "exchanges/:id/status", to: "exchanges#update_status"
  patch "exchanges/:id/offered_vinyl", to: "exchanges#update_offered_vinyl"
  get "vinyls-to-exchange", to: "collections#vinyls_to_exchange"
end
