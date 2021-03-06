Rails.application.routes.draw do

  root 'static_pages#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'pdfs/show'

  resources :users
  resources :ranks
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :attendance_managements do
    collection do
     get :index_2
     get :show_2
     get :show_3
    end
    member do
      get :edit_2
    end
  end

  namespace :admin do
    resources :attendance_managements, only: [:index, :show, :destroy] do
      collection do
        get :shift
        post :approve
      end
    end
    resources :details
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
