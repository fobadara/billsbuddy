Rails.application.routes.draw do
  devise_for :users
  resources :groups, only: %i[ index show new ] 
  resources :bills, only: %i[ index new edit destroy ]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'groups#index'
end
