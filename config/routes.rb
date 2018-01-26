Rails.application.routes.draw do

  root 'welcome#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  resources :meals
  resources :ingredients
  resources :users
  resources :recipes do
    resources :images, only: [:show, :new, :destroy, :edit]
  end
  resources :images
  resources :recipe_ingredients, only: [:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
