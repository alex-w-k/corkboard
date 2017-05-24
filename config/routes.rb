Rails.application.routes.draw do

  root 'home#index'

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
  post '/pro_register', to: 'pro_register#create'
  delete '/logout', to: 'sessions#destroy'
  get '/pro_register/signup', to: 'pro_register#new'
  get '/pro/dashboard', to: 'pro#show'
  get '/twilio-confirmation', to:'twilio_confirmation#new'
  post 'twilio-confirmation', to: 'twilio_confirmation#create'
  get '/hire/new-project-confirmation/:id', to: 'hire/project#confirmation', as: 'new_project_confirmation'

  namespace :pro
    

  end

  namespace :pro_register do
    resources :industry, path: '', only: [:index] do
      resources :category, path: '', only: [:index, :show]
    end
  end

  namespace :hire do
    resources :project, path: ':service', only: [:new, :create]
    resources :industry, path: '', only: [:show] do
      resources :category, path: '', only: [:show]
    end
  end

end
