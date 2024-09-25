Rails.application.routes.draw do
  
  devise_for :users
  get 'items/index'
  root 'items#index'
  get 'sessions/new'
  resources :items ,only: [:index, :new, :create, :show, :edit, :update]
    


  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
