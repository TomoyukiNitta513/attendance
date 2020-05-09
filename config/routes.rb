Rails.application.routes.draw do
  resources :ranks
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :attendance_managements

  # post 'attendance_managements/new', to: 'attendance_managements#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
