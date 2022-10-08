Rails.application.routes.draw do  
  namespace :api do 
    namespace :v1 do
      post 'authenticate', to: 'authentication#create'
      resources :users, only: [:index, :show, :create, :destroy] do
        resources :posts, only: [:index] do 
          resources :comments, only: [:index,:create]
        end
      end

      resources :posts, only: [] do
        resources :comments, only: [:create]
      end
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
