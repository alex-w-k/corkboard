Rails.application.routes.draw do

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  mount ActionCable.server => '/cable'

  #resources :bid, only: [:create, :update]
  resources :bids
  resources :messages

  root 'home#index'

  namespace :api do
    get '/search', to: 'search#search'
    resources :industry, only:[:index]
    resources :category, only:[:index]
    resources :service, only:[:index]
  end

  namespace :home do
    resources :search
  end

  namespace :profile do
    get '/dashboard', to: 'dashboard#show'
  end

  get 'choose-account', as: 'choose_account', to: 'choose_account#index'
  get '/auth/facebook', as: 'facebook_login'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get "users/verify", to: 'users#show_verify', as: 'verify'
  post "users/verify"
  post "users/resend"

  resources :pro, only: [:index, :show, :new, :create]

  resources :projects, only: [:show]
  resources :projects do
    resources :reviews
  end

  resources :pro_dashboard, only: [:index]

  namespace :pro_dashboard do
    resources :open_projects, only: [:index, :show]
    resources :project_bids, only: [:index]
  end

  namespace :pro_register do
    resources :industry, path: 'industries', only: [:index]
    resources :industry, path: '', only: [:show] do
      resources :category, path: '', only: [:show]
    end
  end

  resources :hire, only: [:index]
  namespace :hire do
    resources :project, path: ':service', only: [:new, :create]
    resources :industry, path: '', only: [:show] do
      resources :category, path: '', only: [:show]
    end
  end

  namespace :api do
    namespace :v1 do
      namespace :projects do
        get '/find_all', to: 'find#index'
        put '/:id', to: 'projects#update'
      end
    end
  end
end
