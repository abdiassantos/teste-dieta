Rails.application.routes.draw do

  devise_for :users
  root to: "dashboard#index"

  # post "diets", to: "diets#create"
  # get "diets/new", to: "diets#new"
  # get "diets/index", to: "diets#index"
  # delete "diets/:id/", to: "diets#destroy", as: :diet
  resources :diets, onyl: [:index, :new, :create, :destroy]

end
