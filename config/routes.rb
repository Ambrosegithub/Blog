Rails.application.routes.draw do  
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :destroy]

      post 'authenticate', to: 'authentication#create'
    end
  end 
  devise_for :users
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "users#show" 
  # Defines the root path route ("/")
  # root "articles#index"
  
  scope '/admin' do
  resources :users, only: [:index, :show,:new,:create,:update] do resources :posts, only: [:index, :show] 
  end
end
  resources :posts
  resources :comments, only: [:new, :create, :destroy]
  resources :likes, only: [:create]
end
