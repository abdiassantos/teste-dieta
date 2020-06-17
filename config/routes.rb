Rails.application.routes.draw do

  root to: "dashboard#index"

  post "diets", to: "diets#create"
  get "diets/new", to: "diets#new"
  get "diets/index", to: "diets#index"

end
