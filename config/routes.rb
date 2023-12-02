Rails.application.routes.draw do
  get 'rooms/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  #root "users#index"
  resources :users, :only => [:index, :show]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show]
  resources :perfumes



  
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  root 'posts#index'

  

end
