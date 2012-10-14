Splitpayat::Application.routes.draw do
  root :to => 'pages#home'

  match '/auth/:provider/callback' => 'sessions#create'
  match '/logout' => 'sessions#destroy', :as => :logout
  match '/login' => 'sessions#new', :as => :login
  match '/auth/paypal', :as => :paypal_login

  get'/campaigns' => 'campaigns#index', :as => :campaigns
  post '/campaigns' => 'campaigns#create', :as => :campaigns

  resources :campaigns, path: '' do
    resources :payments do
      member do
        get 'completed'
        get 'canceled'
        post 'ipn'
      end
    end
  end
end
