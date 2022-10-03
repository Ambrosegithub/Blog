Rails.application.routes.draw do  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "users#show" 
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do resources :posts, only: [:index, :show] 
  end
  resources :posts
  resources :comments, only: [:new, :create, :destroy]
  resources :likes, only: [:create]
end
