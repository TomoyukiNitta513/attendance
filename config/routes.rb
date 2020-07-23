Rails.application.routes.draw do

  root 'static_pages#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :ranks
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :attendance_managements do
    collection do
      get :shift
      post :shift
      post :approval_all
      post :edit_2
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
