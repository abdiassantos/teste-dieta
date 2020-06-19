Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: "dashboard#index"

  # post "diets", to: "diets#create"
  # get "diets/new", to: "diets#new"
  # get "diets/index", to: "diets#index"
  # delete "diets/:id/", to: "diets#destroy", as: :diet
  resources :diets, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :infos, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :weights, only: [:index, :new, :create]

end
