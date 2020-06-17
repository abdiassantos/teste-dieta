Rails.application.routes.draw do

  devise_for :users, controllers: {sessions: 'users/sessions'}
  root to: "dashboard#index"

  # post "diets", to: "diets#create"
  # get "diets/new", to: "diets#new"
  # get "diets/index", to: "diets#index"
  # delete "diets/:id/", to: "diets#destroy", as: :diet
  resources :diets, only: [:index, :new, :create, :destroy]
  resources :infos, only: [:index, :new, :create, :destroy]

end
