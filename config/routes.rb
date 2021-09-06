Rails.application.routes.draw do
  resources :clients, only: [:show, :index, :update]
  resources :memberships, only: [:create]
  resources :gyms, only: [:index, :show, :update, :destroy]
end
