Rails.application.routes.draw do

  root to: "diets#index"

  post "diets", to: "diets#create"
  get "diets/new", to: "diets#new"

end
