Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  devise_scope :user do
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end
    unauthenticated do
      root 'splash#index', as: :unauthenticated_root
    end
    get '/users/sign_out' => 'devise/sessions#destroy'
    resources :users, only: [:index]
  end

  resources :groups, only: %i[ index show new create destroy ] do
    resources :bills, only: %i[ index show new create edit destroy ]    
  end
end
